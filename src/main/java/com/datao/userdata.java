package com.datao;

import com.entity.User;

public abstract class userdata {
    public abstract boolean userRegister(User us);

    public abstract User login(String email,String password);
    public abstract boolean checkPassword(int id,String ps);
    
    public abstract boolean updateProfile(User us);
    public abstract boolean checkUser(String em);
}
