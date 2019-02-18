package smb.common.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JsonUtil
{

	/**
	 * Map�� jsonString���� ��ȯ�Ѵ�.
	 *
	 * @param map Map<String, Object>.
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static JSONObject getJsonStringFromMap(Map<String, Object> map) {

		JSONObject json = new JSONObject();
		for( Map.Entry<String, Object> entry : map.entrySet() ) {
			String key = entry.getKey();
			Object value = entry.getValue();
			json.put(key, value);
		}
		
		return json;
	}
	
	/**
	 * List<Map>�� json���� ��ȯ�Ѵ�.
	 *
	 * @param list List<Map<String, Object>>.
	 * @return JSONArray.
	 */
	@SuppressWarnings("unchecked")
	public static JSONArray getJsonArrayFromList( List<Map<String, Object>> list ) {

		JSONArray jsonArray = new JSONArray();
		for( Map<String, Object> map : list ) {
			jsonArray.add( getJsonStringFromMap( map ) );
		}
		
		return jsonArray;
	}
	
	/**
	 * List<Map>�� jsonString���� ��ȯ�Ѵ�.
	 *
	 * @param list List<Map<String, Object>>.
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static String getJsonStringFromList( List<Map<String, Object>> list ) {

		JSONArray jsonArray = new JSONArray();
		for( Map<String, Object> map : list ) {
			jsonArray.add( getJsonStringFromMap( map ) );
		}
		
		return jsonArray.toJSONString();
	}

	/**
	 * JsonObject�� Map<String, String>���� ��ȯ�Ѵ�.
	 *
	 * @param jsonObj JSONObject.
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapFromJsonObject( JSONObject jsonObj ) {
		Map<String, Object> map = null;
		try { map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class); }
		catch (JsonMappingException e) { e.printStackTrace(); }
		catch (IOException e) { e.printStackTrace(); }

        return map;
	}
	
	/**
	 * JsonString�� Map<String, String>���� ��ȯ�Ѵ�.
	 *
	 * @param jsonStr JSONString
	 * @return String.
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapFromJsonString( String jsonStr ) {
		Map<String, Object> map = null;
		try { map = new ObjectMapper().readValue(jsonStr, Map.class); }
		catch (JsonMappingException e) { e.printStackTrace(); }
		catch (IOException e) { e.printStackTrace(); }

        return map;
	}
	
	/**
	 * JsonArray�� List<Map<String, String>>���� ��ȯ�Ѵ�.
	 *
	 * @param jsonArray JSONArray.
	 * @return List<Map<String, Object>>.
	 */
	public static List<Map<String, Object>> getListMapFromJsonArray( JSONArray jsonArray ) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		if( jsonArray != null )
		{
			int jsonSize = jsonArray.size();
			for( int i = 0; i < jsonSize; i++ )
			{
				Map<String, Object> map = JsonUtil.getMapFromJsonObject( ( JSONObject ) jsonArray.get(i) );
				list.add( map );
			}
		}
		
		return list;
	}
}
