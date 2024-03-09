/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class PaginationDAO {
    public List<Group> getListByPage (List<Group> list,
            int start, int end){
        List<Group> arr = new ArrayList<>();
        for(int i=start;i<end;i++){
            arr.add(list.get(i));
        }
        return arr;
    }
}
