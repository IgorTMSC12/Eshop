package by.teachmeskills.eshop.repositories;

import by.teachmeskills.eshop.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    List<Order> getOrdersByUserId(int userId);
}
