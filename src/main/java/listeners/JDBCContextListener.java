
package listeners;

import dao.impl.ArticleDaoImpl;
import dao.impl.GrowUserDaoImpl;
import dao.impl.RequestDaoImpl;
import domain.GrowUser;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;
import services.impl.jdbc.ArticleJDBCImpl;
import services.impl.jdbc.GrowUserJDBCImpl;
import services.impl.jdbc.RequestDaoJDBCImpl;

public class JDBCContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/heroku_a6ba2d62a41cee6");
            
            
            RequestDaoImpl reqService = RequestDaoImpl.getInstance(ds);
            GrowUserDaoImpl usService = GrowUserDaoImpl.getInstance(ds);
            ArticleDaoImpl artService = ArticleDaoImpl.getInstance(ds);
            
            RequestDaoJDBCImpl reqJdService = RequestDaoJDBCImpl.getInstance(reqService);
            sce.getServletContext().setAttribute("reqService", reqJdService);
            
            GrowUserJDBCImpl usJdService = GrowUserJDBCImpl.getInstance(usService);
            sce.getServletContext().setAttribute("usService", usJdService);
            
            ArticleJDBCImpl artJdService = ArticleJDBCImpl.getInstance(artService);
            sce.getServletContext().setAttribute("artService", artJdService);
            
                    
        } catch (NamingException ex) {
            Logger.getLogger(JDBCContextListener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        RequestDaoJDBCImpl reqJdService = (RequestDaoJDBCImpl) sce.getServletContext().getAttribute("reqService");
        if (reqJdService != null) {
            sce.getServletContext().removeAttribute("reqService");
        }
        GrowUserJDBCImpl usJdService = (GrowUserJDBCImpl) sce.getServletContext().getAttribute("usService");
        if (usJdService != null) {
             sce.getServletContext().removeAttribute("usService");
        }
        ArticleJDBCImpl artJdService = (ArticleJDBCImpl) sce.getServletContext().getAttribute("artService");
        if (artJdService != null) {
            sce.getServletContext().removeAttribute("artService");
        }
    }

    
}
