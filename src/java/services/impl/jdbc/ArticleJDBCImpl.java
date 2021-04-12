
package services.impl.jdbc;

import dao.impl.ArticleDaoImpl;
import domain.Article;
import java.util.List;
import services.ObjectDaoJDBCIntf;


public class ArticleJDBCImpl implements ObjectDaoJDBCIntf<Article>{

    private ArticleDaoImpl artService;
    private ArticleJDBCImpl (ArticleDaoImpl artService) {
        this.artService = artService;
    }
    
    private static ArticleJDBCImpl instance;
    public static ArticleJDBCImpl getInstance(ArticleDaoImpl usService) {
        if(instance == null) {
            instance = new ArticleJDBCImpl(usService);
        }
        return instance;
    }
    
    
    @Override
    public void save(Article obj) {
        artService.save(obj);
    }

    @Override
    public void update(Article obj) {
        artService.update(obj);
    }

    @Override
    public void delete(Article obj) {
        artService.delete(obj);
    }

    @Override
    public Article findById(int id) {
        return artService.findById(id);
    }

    @Override
    public List<Article> findAll() {
        return artService.findAll();
    }
    
}
