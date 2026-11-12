import java.sql.*;	
public class UserManager {
 public boolean printUser() throws SQLException {
  boolean isValid = false;
  try (Connection connection = 
    DriverManager.getConnection("jdbc:postgresql://localhost:5432/app_db", 
                                "postgres", "postgres")){
   isValid = connection.isValid(2);
   try(PreparedStatement statement = 
     connection.prepareStatement("SELECT * FROM users WHERE user_id=?;");){
    statement.setInt(1, 1);
     try (ResultSet resultSet = statement.executeQuery()) {
      while (resultSet.next()) {
       System.out.println(resultSet.getString("email"));
      }
     }
   }
  }
  return isValid;
 }	
 public static void main(String... args) throws Exception {
  new UserManager().printUser();
 }
}
