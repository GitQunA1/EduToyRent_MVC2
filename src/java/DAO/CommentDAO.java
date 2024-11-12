/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.DBUtils;
import Entity.Comment;
import Entity.Reply;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HagiLee
 */
public class CommentDAO {

    public List<Comment> GetComment(int pid) {
        List<Comment> comment = new ArrayList<>();
        String sql = "SELECT * FROM [Comment] WHERE PID = ?";
        try {
            Connection conn = new DBUtils().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("CID");
                int uid = rs.getInt("UID");
                int odid = rs.getInt("ODID");
                String comm = rs.getString("Comment");
                String date = rs.getString("[Date]");
                String satisfaction = rs.getString("[satisfaction]");
                String image = rs.getString("[image]");
                int status = rs.getInt("Status");

                Comment c = new Comment(cid, uid, pid, odid, comm, date, satisfaction, image, status);
                comment.add(c);
            }
            return comment;
        } catch (Exception e) {
        }
        return comment;
    }
    
    public boolean insertComment(int uid, int pid, int odid, String comment, String satisfaction, String image){
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String date = currentDateTime.format(formatter);
        String sql = "INSERT INTO [Comment] (UID, PID, ODID, Comment, Date, satisfaction, image, Status) VALUES (?, ?, ?, ?, ?, ?, ?, 1)";
        try {
            Connection conn = new DBUtils().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.setInt(3, odid);
            ps.setString(4, comment);
            ps.setString(5, date);
            ps.setString(6, satisfaction);
            ps.setString(7, image);
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected>0)
                return true;
        } catch (Exception e) {
        }
        return false;
    }

    public List<Reply> GetReply(int pid) {
        List<Reply> reply = new ArrayList<>();
        String sql = "SELECT * FROM [Reply] WHERE PID = ?";
        try {
            Connection conn = new DBUtils().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("CID");
                int soid = rs.getInt("[SOID]");
                String comm = rs.getString("[comment]");
                String date = rs.getString("[Date]");
                String image = rs.getString("[image]");
                int status = rs.getInt("Status");

                Reply r = new Reply(cid, pid, soid, comm, date, image, status);
                reply.add(r);
            }
            return reply;
        } catch (Exception e) {
        }
        return reply;
    }
    
    public boolean insertReply(int cid, int pid, int soid, String comment, String image){
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String date = currentDateTime.format(formatter);
        String sql = "INSERT INTO [Reply] (CID,PID, SOID, Comment, Date, Image, Status) VALUES (?, ?, ?, ?, ?, ?, 1)";
        try {
            Connection conn = new DBUtils().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setInt(2, pid);
            ps.setInt(3, soid);
            ps.setString(4, comment);
            ps.setString(5, date);
            ps.setString(6, image);
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected>0)
                return true;
        } catch (Exception e) {
        }
        return false;
    }
}
