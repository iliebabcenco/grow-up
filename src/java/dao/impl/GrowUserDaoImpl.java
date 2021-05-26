package dao.impl;

import dao.ObjectDaoIntf;
import domain.GrowUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

public class GrowUserDaoImpl implements ObjectDaoIntf<GrowUser> {

    private static GrowUserDaoImpl instance;
    private DataSource ds;

    private GrowUserDaoImpl(DataSource ds) {
        this.ds = ds;
    }

    public static GrowUserDaoImpl getInstance(DataSource ds) {
        if (instance == null) {
            instance = new GrowUserDaoImpl(ds);
        }
        return instance;
    }

    @Override
    public void save(GrowUser obj) {
        String sql = "INSERT into growusers VALUES (null, ?, ?, ?, ?, ?, ?);";
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, obj.getUsername());
            ps.setString(2, obj.getPassword());
            ps.setString(3, obj.getPhone());
            ps.setString(4, obj.getEmail());
            ps.setString(5, obj.getIdnp());
            ps.setBoolean(6, obj.isAdmin());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(GrowUserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(GrowUser obj) {
        String sql = "UPDATE growusers SET username=?, password=?, phone=?, email=?, idnp=?, isAdmin=?";
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, obj.getUsername());
            ps.setString(2, obj.getPassword());
            ps.setString(3, obj.getPhone());
            ps.setString(4, obj.getEmail());
            ps.setString(5, obj.getIdnp());
            ps.setBoolean(6, obj.isAdmin());
            ps.execute();

        } catch (SQLException ex) {
            Logger.getLogger(GrowUserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void delete(GrowUser obj) {
        String sql = "DELETE FROM growusers WHERE id=" + obj.getId();
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(GrowUserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public GrowUser findById(int id) {
        GrowUser gu = null;
        String sql = "SELECT * FROM growusers WHERE id=?";
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                gu = new GrowUser();
                gu.setId(id);
                gu.setUsername(rs.getString(1));
                gu.setPassword(rs.getString(2));
                gu.setPhone(rs.getString(3));
                gu.setEmail(rs.getString(4));
                gu.setIdnp(rs.getString(5));
                gu.setAdmin(rs.getBoolean(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(GrowUserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return gu;
    }

    public GrowUser finByUsername(String username) {
        GrowUser gu = null;
        String sql = "SELECT * FROM growusers WHERE username=?";
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                gu = new GrowUser();
                gu.setId(rs.getInt(1));
                gu.setUsername(username);
                gu.setPassword(rs.getString(3));
                gu.setPhone(rs.getString(4));
                gu.setEmail(rs.getString(5));
                gu.setIdnp(rs.getString(6));
                gu.setAdmin(rs.getBoolean(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(GrowUserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return gu;
    }

    @Override
    public List<GrowUser> findAll() {
        String sql = "SELECT * FROM growusers;";
        List<GrowUser> list = new ArrayList<>();
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new GrowUser(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getBoolean(7)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(GrowUserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

}
