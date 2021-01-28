/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cohort2;

import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.NotFoundException;

/**
 *
 * @author chand
 */
public class UserService {

    private static List<User> users = new ArrayList<User>();

    public UserService() {
        if (users.isEmpty()) {
            users.add(new User(100, "A", "a@abc.com"));
            users.add(new User(101, "B", "b@bda.com"));
            users.add(new User(102, "C", "c@cdb.com"));
        }
    }

    public List<User> fetchAll() {
        users.forEach(System.out::println);
        return users;
    }

    public User fetchBy(int id) throws NotFoundException {
        for (User user : users) {
            System.out.println(" users fetched " + user.getId());
            if (id == user.getId()) {
                System.out.println(" User Fetched :: " + user);
                return user;
            } 
        }
        return null;
    }

    public User create(User user) {
        users.add(user);
        System.out.println(" User Added " + user);
        return user;
    }

    public User update(User user) {
        for (User user2 : users) {
            if (user.getId() == user2.getId()) {
                users.remove(user2);
                users.add(user);
                System.out.println(" user Updated  ::" + user);
                return user;
            }
        }
        return null;
    }

    public User delete(int id) throws NotFoundException {
        User user2 = this.fetchBy(id);
        users.remove(user2);
        System.out.println(" User Deleted :: " + user2);
        return user2;
    }
}
