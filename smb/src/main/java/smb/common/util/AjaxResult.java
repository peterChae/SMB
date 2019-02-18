package smb.common.util;

import java.io.Serializable;

public class AjaxResult implements Serializable
{

	/**
	 * 세션 클러스터링을 하는 경우, 세션 유지를 위한 직렬화
	 */
	private static final long serialVersionUID = 7086618717736188769L;

	private Object data;		// 결과데이터
	private String result;		// 결과값		성공: Success, 실패: Fail
	private int resultCode;		// 결과코드	성공: 0, 실패 : -1
	private String msg;			// 결과메세지
	private String returnURL;	// 페이지 이동 URL

	public AjaxResult() {
	}

	public AjaxResult(final Object data, final boolean isSuccess, final String msg, final String returnURL) {
		super();
		setData(data);
		setResult(isSuccess ? "Success" : "Fail");
		setResultCode(isSuccess ? 0 : -1);
		setMsg(msg);
		setReturnURL(returnURL);
	}

	public Object getData() {
		return data;
	}

	public void setData(final Object data) {
		this.data = data;
	}

	public String getResult() {
		return result;
	}

	public void setResult(final String result) {
		this.result = result;
	}

	public int getResultCode() {
		return resultCode;
	}

	public void setResultCode(final int resultCode) {
		this.resultCode = resultCode;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(final String msg) {
		this.msg = msg;
	}

	public String getReturnURL() {
		return returnURL;
	}

	public void setReturnURL(final String returnURL) {
		this.returnURL = returnURL;
	}

	@Override
	public String toString() {
		return "AjaxResult [data=" + data + ", result=" + result + ", resultCode=" + resultCode + ", msg=" + msg
				+ ", returnURL=" + returnURL + "]";
	}
}
