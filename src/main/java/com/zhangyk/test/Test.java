package com.zhangyk.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Stack;
import java.util.concurrent.Callable;
import java.util.function.Function;

public class Test {


    public void nextPermutation(int[] nums) {

        if (nums.length < 2) {
            return;
        }

        int index = 0;
        for (index = nums.length - 1; index > 0; index --) {

            if (nums[index] > nums[index - 1]) {
                break;
            }
        }
        int indexJ = nums.length - 1;

        if (index > 0) {
            while (nums[indexJ] <= nums[index -1]) {
                indexJ --;
            }
            int temp = nums[index - 1];
            nums[index - 1] = nums[indexJ];
            nums[indexJ] = temp;
        }

        int j = nums.length - 1;
        while (index < j) {
            int temp = nums[index];
            nums[index] = nums[j];
            nums[j] = temp;
        }

    }
}

class ListNode {
    int val;
    ListNode next;
    ListNode(int x) { val = x; }
}
