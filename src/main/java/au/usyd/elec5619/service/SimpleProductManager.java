package au.usyd.elec5619.service;

import au.usyd.elec5619.entity.Product;

import java.util.List;

public class SimpleProductManager implements ProductManager {
    private List<Product> products;

    @Override
    public void increasePrice(int percentage) {
        if (products != null) {
            for (Product product : products) {
                double newPrice = product.getPrice().doubleValue() * (100 + percentage) / 100;
                product.setPrice(newPrice);
            }
        }
    }

    @Override
    public List<Product> getProducts() {
        return products;
    }

    @Override
    public void addProduct(Product product) {

    }

    @Override
    public Product getProductById(long id) {
        return null;
    }

    @Override
    public void updateProduct(Product product) {

    }

    @Override
    public void deleteProduct(long id) {

    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
