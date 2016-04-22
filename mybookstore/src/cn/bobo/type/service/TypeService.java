package cn.bobo.type.service;

import java.util.List;

import cn.bobo.domain.Types;
import cn.bobo.type.dao.TypeDao;

public class TypeService implements ITypeService {
	private TypeDao dao = new TypeDao();
	public List<Types> queryAll(){
		return dao.queryAll();
	}
}
