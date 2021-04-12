package services.impl.jdbc;

import services.ObjectDaoJDBCIntf;
import dao.impl.RequestDaoImpl;
import domain.Request;
import java.util.List;



public class RequestDaoJDBCImpl implements ObjectDaoJDBCIntf<Request>{

    RequestDaoImpl reqService;
    private RequestDaoJDBCImpl (RequestDaoImpl reqService) {
        this.reqService = reqService;
    }
    private static RequestDaoJDBCImpl instance;
    public static RequestDaoJDBCImpl getInstance(RequestDaoImpl reqService) {
        if(instance == null) {
            instance = new RequestDaoJDBCImpl(reqService);
        }
        return instance;
    }
    
    
    @Override
    public void save(Request obj) {
        reqService.save(obj);
    }

    @Override
    public void update(Request obj) {
        reqService.update(obj);
    }

    @Override
    public void delete(Request obj) {
        reqService.delete(obj);
    }

    @Override
    public Request findById(int id) {
        return reqService.findById(id);
    }

    @Override
    public List<Request> findAll() {
        return reqService.findAll();
    }
    
    
}
