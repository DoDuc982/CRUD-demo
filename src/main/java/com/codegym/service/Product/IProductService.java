package com.codegym.service.Product;

import com.codegym.model.Product;
import com.codegym.service.IGeneralService;

import java.util.List;

public interface IProductService extends IGeneralService<Product> {
    List<Product> findAllProductByCategory(int categoryId);
    boolean insertProductUsingProcedure(Product product);
    List<Product> findAllProductsByName(String name);
}
