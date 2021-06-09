
package services.impl.jdbc;

import dao.ObjectDaoIntf;
import dao.impl.GrowUserDaoImpl;
import domain.GrowUser;
import java.util.List;


public class GrowUserJDBCImpl implements ObjectDaoIntf<GrowUser>{

    
    private GrowUserDaoImpl usService;
    private GrowUserJDBCImpl (GrowUserDaoImpl usService) {
        this.usService = usService;
    }
    
    private static GrowUserJDBCImpl instance;
    public static GrowUserJDBCImpl getInstance(GrowUserDaoImpl usService) {
        if(instance == null) {
            instance = new GrowUserJDBCImpl(usService);
        }
        return instance;
    }
    
    
    @Override
    public void save(GrowUser obj) {
        usService.save(obj);
    }

    @Override
    public void update(GrowUser obj) {
        usService.update(obj);
    }

    @Override
    public void delete(GrowUser obj) {
        usService.delete(obj);
    }

    @Override
    public GrowUser findById(int id) {
        return usService.findById(id);
    }
    public GrowUser findByUsername(String username) {
        return usService.finByUsername(username);
    }
    
    @Override
    public List<GrowUser> findAll() {
        return usService.findAll();
    }
    
}
