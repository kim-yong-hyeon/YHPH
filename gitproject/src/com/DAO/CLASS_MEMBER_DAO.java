package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DTO.CLASS_MEMBER_DTO;

public class CLASS_MEMBER_DAO {
   // DAO�� ����� ����
   // 1. �ߺ��Ǵ� �ڵ带 �ּ�ȭ�ϱ� ���ؼ�(������������)
   // 2. ���������� ��ȭ�ϱ� ���ؼ�
   // 3. DB�� ���õǴ� ��� �ڵ带 �ۼ�

   private Connection conn = null;
   private PreparedStatement pst = null;
   private ResultSet rs = null;
   int cnt = 0;

   private void getConn() {
      try {
          Class.forName("oracle.jdbc.driver.OracleDriver");
            // 2.DB����
            String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
            String user_id = "hr";
            String user_pw = "hr";
            conn = DriverManager.getConnection(url, user_id, user_pw);
            if (conn != null) {
               System.out.println("���� ����");
            } else {
               System.out.println("���� ����");
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
   }

   private void close() {
      try {
         if (pst != null) {
            pst.close();
         }
         if (conn != null) {
            conn.close();
         }
      } catch (Exception e2) {
         e2.printStackTrace();
      }
   }

   public int Join(CLASS_MEMBER_DTO dto) {
      try {
         getConn();
         String sql = "insert into class_member(email,nickname,pw,job) values(?,?,?,?)";
         pst = conn.prepareStatement(sql);
         pst.setString(1, dto.getEmail());
         pst.setString(2, dto.getNickname());
         pst.setString(3, dto.getPw());
         pst.setInt(4, dto.getJob());
//         pst.setInt(5, dto.getStudentlevel());

         cnt = pst.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close();
      }

      return cnt;
   }
   
   public CLASS_MEMBER_DTO login(CLASS_MEMBER_DTO dto) {
      getConn();//connection
      
      CLASS_MEMBER_DTO info= null;
      try {
         String sql = "select * from class_member where email=? and pw=?";
         
         pst = conn.prepareStatement(sql);
         pst.setString(1, dto.getEmail());
         pst.setString(2, dto.getPw());
         
         rs = pst.executeQuery();
         
         while(rs.next()) { //Ŀ�����̵��Ҽ��ִٴ� ���� �α��ο� ������ �ߴٴ°�
            String email = rs.getString(1);//"email" => column������ �ᵵ ��
            String nickname = rs.getString(2);
            String pw = rs.getString(3);
            int job = rs.getInt(4);
            int studentlevel = rs.getInt(5);
            
            info = new CLASS_MEMBER_DTO(email, nickname, pw, job, studentlevel);
//            info = new CLASS_MEMBER_DTO(email, nickname, pw, job, studentlevel);
         }
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(); //�ݱ�
      }
      return info;
   }
   

   public int Delete(String id) {
      // DeleteCheck�� �ִ� JDBC�ڵ带 ���� �޼ҵ�� �и�

      try {
         getConn();

         String sql = "delete from web_member where id=?";
         pst = conn.prepareStatement(sql);
         pst.setString(1, id);

         cnt = pst.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return cnt;
   }

   public int Update(String id, String update, String update_con) {

      try {
         getConn();

         String sql = "";
         if (update.equals("PW")) {
            sql = "update web_member set pw=? where id=?";
         } else if (update.equals("NICK")) {
            sql = "update web_member set nick=? where id=?";
         }

         pst = conn.prepareStatement(sql);
         pst.setString(1, update_con);
         pst.setString(2, id);

         cnt = pst.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return cnt;

   }

   
   
}