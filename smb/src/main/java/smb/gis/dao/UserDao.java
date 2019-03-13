package smb.gis.dao;

import org.springframework.stereotype.Repository;

import smb.common.dao.AbstractDao;

@Repository("userDao")
public class UserDao extends AbstractDao {
	
	public String getUserInfo() throws Exception {
		return (String)selectOne("gis.userInfo");
	}
}
