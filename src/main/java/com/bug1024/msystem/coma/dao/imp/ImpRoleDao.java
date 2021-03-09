package com.bug1024.msystem.coma.dao.imp;



import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.coma.dao.RoleDao;
import com.bug1024.msystem.utils.orm.SqlSession;

import java.util.HashMap;
import java.util.List;

public class ImpRoleDao implements RoleDao {

    public List<Role> selectList(Integer begin, Integer end, Integer rno, String rname, String description) {
        SqlSession sqlSession = new SqlSession();
        StringBuffer sql = new StringBuffer("select * from t_role where 1=1 ");
        if(rno!=null){
            sql.append(" and rno = #{rno}");
        }
        if(rname!=null){
            sql.append(" and rname like concat('%',concat(#{rname},'%'))");
        }
        if (description!=null){
            sql.append(" and description like concat('%',concat(#{description},'%'))");
        }
        sql.append(" limit #{begin},#{end}");
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("rno",rno);
        map.put("rname",rname);
        map.put("description",description);
        map.put("begin",begin);
        map.put("end",end);
        return sqlSession.selectList(sql.toString(),map,Role.class);
    }

    //获取总数
    public Integer getAllNum(Integer rno,String rname,String description){
        SqlSession sqlSession = new SqlSession();
        StringBuffer sql = new StringBuffer("select count(*) from t_role where 1=1 ");
        if(rno!=null){
            sql.append(" and rno = #{rno}");
        }
        if(rname!=null){
            sql.append(" and rname like concat('%',concat(#{rname},'%'))");
        }
        if (description!=null){
            sql.append(" and description like concat('%',concat(#{description},'%'))");
        }
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("rno",rno);
        map.put("rname",rname);
        map.put("description",description);
        return (Integer) sqlSession.selectOne(sql.toString(),map,Integer.class);
    }

    public List<Menu> selectMenusByRoleId(Integer rno) {
        return null;
    }

    public List<Menu> selectNoMenusByRoleId(Integer rno) {
        return null;
    }

    public void saveMenusForRole(HashMap<String, Integer> map) {
        return;
    }

    public void deleteMenusForRole(Integer rno) {
        return;
    }

    @Override
    public Integer delete(Integer rno) {
        SqlSession sqlSession = new SqlSession();
        StringBuffer sql = new StringBuffer("delete from t_role where rno=#{rno} ");
        HashMap<String,Object> map = new HashMap<String,Object>();
        map.put("rno",rno);
        return (Integer) sqlSession.delete(sql.toString(),map);
    }
}
