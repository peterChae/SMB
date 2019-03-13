package smb.common.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import smb.common.dao.LoginDao;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	Logger log = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	@Resource(name="loginDao")
	private LoginDao loginDao;

	@Override
	public void checkLogin() throws Exception {

	}
}
