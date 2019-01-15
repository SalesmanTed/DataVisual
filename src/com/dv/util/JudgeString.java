package com.dv.util;

import java.math.BigDecimal;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class JudgeString {
	public boolean isNumeric(String str) {
        // 该正则表达式可以匹配所有的数字 包括负数
        try {
            double d = Double.parseDouble(str);
        } catch (Exception e) {
            return false;//异常 说明包含非数字。
        }
        return true;
    }
}
