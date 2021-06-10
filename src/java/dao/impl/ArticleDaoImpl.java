package dao.impl;

import dao.ObjectDaoIntf;
import domain.Article;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

public class ArticleDaoImpl implements ObjectDaoIntf<Article> {

    private static ArticleDaoImpl instance;
    private DataSource ds;

    private ArticleDaoImpl(DataSource ds) {
        this.ds = ds;
    }

    public static ArticleDaoImpl getInstance(DataSource ds) {
        if (instance == null) {
            instance = new ArticleDaoImpl(ds);
        }
        return instance;
    }

    @Override
    public void save(Article obj) {
        String sql = "INSERT into articles VALUES (null, ?, ?);";
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, obj.getTitle());
            ps.setString(2, obj.getContent());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Article obj) {
        String sql = "UPDATE articles SET title=?, content=? WHERE id="+obj.getId();
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, obj.getTitle());
            ps.setString(2, obj.getContent());
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Article obj) {
        String sql = "DELETE FROM articles WHERE id=" + obj.getId();
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Article findById(int id) {
        Article art = null;
        String sql = "SELECT * FROM articles WHERE id=?";
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
               ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                art = new Article();
                art.setId(id);
                art.setTitle(rs.getString(2));
                art.setContent(rs.getString(3));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticleDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return art;
    }

    @Override
    public List<Article> findAll() {
        String sql = "SELECT * FROM articles;";
        List<Article> list = new ArrayList<>();
         try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
               ) {
             ResultSet rs = ps.executeQuery();
             while (rs.next()) {
                 list.add(new Article(rs.getInt(1), rs.getString(2), 
                         rs.getString(3)));
             }
         } catch (SQLException ex) {
            Logger.getLogger(GrowUserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
