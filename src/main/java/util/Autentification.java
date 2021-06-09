package util;

import domain.GrowUser;
import javax.servlet.http.HttpServlet;
import services.impl.jdbc.GrowUserJDBCImpl;

public class Autentification extends HttpServlet {

    public static GrowUser check(String username, String password, GrowUserJDBCImpl userService) throws Exception {
        GrowUser user = null;
        try {
            user = userService.findByUsername(username);
            System.out.println("user.getPassword = "+user.getPassword()+" password "+password);
            if (user.getPassword().equals(password)) {
                return user;
            } else {
                throw new Exception("Parola invalida! cu "+"user.getPassword = "+user.getPassword()+" password "+password);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw ex;
        }
    }
}
