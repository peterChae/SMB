package smb.common.util;

import java.io.Serializable;

public class AjaxResult implements Serializable
{

	/**
	 * ���� Ŭ�����͸��� �ϴ� ���, ���� ������ ���� ����ȭ
	 */
	private static final long serialVersionUID = 7086618717736188769L;

	private Object data;		// ���������
	private String result;		// �����		����: Success, ����: Fail
	private int resultCode;		// ����ڵ�	����: 0, ���� : -1
	private String msg;			// ����޼���
	private String returnURL;	// ������ �̵� URL

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
