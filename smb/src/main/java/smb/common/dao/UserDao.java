package smb.common.dao;

import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDao extends AbstractDao {
	
	public String getUserInfo() throws Exception {
		return (String)selectOne("gis.userInfo");
	}
}
