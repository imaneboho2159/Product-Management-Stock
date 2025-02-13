package net.javaguide.stockmanagement.dao;

public class ProductDAO {
	
private String jdbcURL = "jdbc:mysql://localhost:3306/stock?useSSL=false";
private String jdbcUsername ="root" ;
private String jdbcPasseword ="imaboh@2159@";


private static final String INSERT_PRODUCT_SQL = "INSERT INTO Product (name, description, quantity, unit_price, category_id) VALUES (?, ?, ?, ?, ?)";


private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM Product";
private static final String DELETE_PRODUCT_SQL = "DELETE FROM Product WHERE id = ?";
private static final String UPDATE_PRODUCT_SQL = "UPDATE Product SET name = ?, description = ?, quantity = ?, unit_price = ?, category_id = ? WHERE id = ?";

 protected connection getConnection() {
	 Connection connection = null;
	 
	 try {
		 Class.ForName("com.mysql.cj.jdbc.Driver")
		 connection = DriverManager.getConnection(jdbcURL, jdbsUsername, jdbcPassword);
	 }
	 catch (SQLExeption | ClassNotFoundException e) {
		 e.printStackTrace();
	 }
	 return connection;
}
 
 public void insertProduct(Product product) throws SQLException{
	 try ( Connection connection = getConnection();PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)){
		 preparedStatemet.setString(1,product.getName());
		 preparedStatemet.setString(2,product.getDescription());
		 preparedStatemet.setString(3,product.getQuantity());
		 preparedStatemet.setString(4,product.getPrice());
		 preparedStatemet.setString(5,product.getCategory());
		 preparedStatement.executeUpdate();
	 }
 } catch (SQLException e) {
     e.printStackTrace();
 }
 }
 

 
public List<Product> selectAllProducts() {
    List<Product> products = new ArrayList<>();
    try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            Product product = new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getInt("quantity"),
                    rs.getDouble("unit_price"),
                    rs.getString("category_id")
            );
            products.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return products;
}
public void deleteProduct(int id) throws SQLException {
    try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
public void updateProduct(Product product) throws SQLException {
    try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
        preparedStatement.setString(1, product.getName());
        preparedStatement.setString(2, product.getDescription());
        preparedStatement.setInt(3, product.getQuantity());
        preparedStatement.setDouble(4, product.getPrice());
        preparedStatement.setString(5, product.getCategory());
        preparedStatement.setInt(6, product.getId());
        preparedStatement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
}

