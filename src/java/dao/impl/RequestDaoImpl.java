package dao.impl;

import dao.ObjectDaoIntf;
import domain.Request;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

public class RequestDaoImpl implements ObjectDaoIntf<Request> {

    private static RequestDaoImpl instance;
    private DataSource ds;

    private RequestDaoImpl(DataSource ds) {
        this.ds = ds;
    }

    public static RequestDaoImpl getInstance(DataSource ds) {
        if (instance == null) {
            instance = new RequestDaoImpl(ds);
        }
        return instance;
    }

    @Override
    public void save(Request obj) {
        String sql = "INSERT into requests VALUES (null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, obj.getName());
            ps.setString(2, obj.getSurename());
            ps.setString(3, obj.getIdnp());
            ps.setDate(4, obj.getBirthday());
            ps.setString(5, obj.getCard_id());
            ps.setString(6, obj.getResidence());
            ps.setInt(7, obj.getSum());
            ps.setInt(8, obj.getTerm());
            ps.setString(9, obj.getMail());
            ps.setString(10, obj.getPhone());
            ps.setString(11, obj.getIncome());
            ps.setString(12, obj.getFileName());
            ps.setObject(13, obj.getFileData());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Request obj) {
        String sql = "UPDATE requests SET name=?, surename=?, idnp=?, birthday=?, card_id=?, "
                + "residence=?, sum=?, term=?, mail=?, phone=?, income=? WHERE id=" + obj.getId();
        try (
                Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setString(1, obj.getName());
            ps.setString(2, obj.getSurename());
            ps.setString(3, obj.getIdnp());
            ps.setDate(4, new java.sql.Date(obj.getBirthday().getTime()));
            ps.setString(5, obj.getCard_id());
            ps.setString(6, obj.getResidence());
            ps.setInt(7, obj.getSum());
            ps.setInt(8, obj.getTerm());
            ps.setString(9, obj.getMail());
            ps.setString(10, obj.getPhone());
            ps.setString(11, obj.getIncome());
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Request obj) {
        String sql = "DELETE FROM requests WHERE id=" + obj.getId();
        try (
                Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Request findById(int id) {
        String sql = "SELECT * FROM requests WHERE id=?;";
        Request req = null;
        try (
                Connection conn = ds.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                req = new Request(id, rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9),
                        rs.getString(10), rs.getString(11), rs.getString(12));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return req;
    }

    @Override
    public List<Request> findAll() {
        List<Request> requests = new ArrayList<>();
        String sql = "SELECT * FROM requests";
        try (
                Connection conn = ds.getConnection();
                Statement smt = conn.createStatement();) {

            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {

                requests.add(new Request(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6), rs.getString(7), rs.getInt(8),
                        rs.getInt(9), rs.getString(10), rs.getString(11),
                        rs.getString(12), rs.getString(13), rs.getBytes(14)));
            }
        } catch (SQLException e) {
            Logger.getLogger(RequestDaoImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return requests;
    }

}
