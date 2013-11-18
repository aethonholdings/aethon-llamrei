package com.llamrei.services

import java.security.SecureRandom

class UtilityService {
    static long uniqueId=2
    static transactional = true

    def uniqueIdFormat() {
        /* Assign a string that contains the set of characters you allow. */
        String symbols = "0123456789abcdef";
        String s="abcdefghijklmnopqrstuvwxyz"
        Random random = new SecureRandom();
        char[] buf;
        buf = new char[16];
        def bufLength = buf.length
        for (int idx = 0; idx < bufLength;idx++)
        buf[idx] = symbols.charAt(random.nextInt(symbols.length()));

        buf[bufLength-1]  = s.charAt(random.nextInt(s.length()))
        return new String(buf);
    }
}

