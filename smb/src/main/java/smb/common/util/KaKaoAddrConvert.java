package smb.common.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class KaKaoAddrConvert {
	
	public static Map<String,String> KakaoGisPoint(final String full_addr) throws Exception {
		
		String postResult 		  			= "";
	    String url ="https://dapi.kakao.com/v2/local/search/address.json";
	    URL obj = new URL(url + "?"+"query="+ URLEncoder.encode(full_addr, "UTF-8"));
        HttpsURLConnection.setDefaultHostnameVerifier(new FakeHostnameVerifier());
	    HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

	    con.setRequestMethod("GET");
	    con.setRequestProperty("Authorization", "KakaoAK 463f278c92f5703098cdc5cbd9860cce");
	    con.setRequestProperty("Accept", "application/json"); 
	    con.setRequestProperty("Content-Type", "application/json");
		con.setRequestProperty("User-Agent", url);
		con.setRequestProperty("Accept-Language", "UTF-8");
		
		String urlParameters = "query=" + full_addr;
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		postResult= KaKaoAddrConvert.decode(response.toString());
			
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject)jsonParser.parse(postResult);
        JSONArray kakaoArray_main = (JSONArray)jsonObj.get("documents");
        JSONObject kakaoArray_main1 =  (JSONObject)jsonObj.get("meta");
        Map<String, Object> map = getMapFromJsonObject(kakaoArray_main1);
        Map<String,String> kakao_result_map = new HashMap<String, String>();
        
        if(map.get("total_count").toString().equals("1")){
	        JSONObject tempObj = (JSONObject) kakaoArray_main.get(0);
	        
	        JSONObject jsonNormalAddr =(JSONObject) tempObj.get("address");
	        Map<String, Object> normalAddr =getMapFromJsonObject(jsonNormalAddr);
	        
	        kakao_result_map.put("full_addr", (String)tempObj.get("address_name"));
	        kakao_result_map.put("si", (String)normalAddr.get("region_1depth_name"));
	        kakao_result_map.put("gu", (String)normalAddr.get("region_2depth_name"));
	        kakao_result_map.put("dong", (String)normalAddr.get("region_3depth_name"));
	        kakao_result_map.put("x", (String)tempObj.get("y"));
	        kakao_result_map.put("y", (String)tempObj.get("x"));
        }

//        Iterator<String> mapIter = kakao_result_map.keySet().iterator();
//        while(mapIter2.hasNext()){
//            String key = mapIter.next();
//            String value = kakao_result_map.get(key);
//            log.debug(key+" : "+value);
//        }
        
        return kakao_result_map;
	}
	
	
	public static Map<String, Object> getMapFromJsonObject(JSONObject jsonObj) {
	    Map<String, Object> map = null;
	    try {
	        map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class) ;
	    } catch (JsonParseException e) {
	        e.printStackTrace();
	    } catch (JsonMappingException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	
	    return map;
	}
	
	/**
     * JsonArray를 List<Map<String, String>>으로 변환한다.
     *
     * @param jsonArray JSONArray.
     * @return List<Map<String, Object>>.
     */
    public static List<Map<String, Object>> getListMapFromJsonArray(JSONArray jsonArray) {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        
        if( jsonArray != null )
        {
            int jsonSize = jsonArray.size();
            for(int i=0; i<jsonSize; i++) {
                Map<String, Object> map = JsonUtil.getMapFromJsonObject((JSONObject)jsonArray.get(i));
                list.add(map);
            }
        }
        
        return list;
    }
    
	public static String decode(String uni) {
		StringBuffer str = new StringBuffer();
		for(int i= uni.indexOf("\\u") ; i > -1 ; i = uni.indexOf("\\u")) {
			str.append( uni.substring( 0, i ) );
			str.append( String.valueOf( (char)Integer.parseInt( uni.substring( i + 2, i + 6 ) ,16) ) );
			uni = uni.substring( i +6);
		}
		str.append(uni);
		return str.toString();
	}
}

//DNS 세팅
class FakeHostnameVerifier implements HostnameVerifier {
    public boolean verify(String hostname, SSLSession session) {
    	return true;
    }
}
