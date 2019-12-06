package com.util;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Test {

	int pr[] = { 0, 0,-1, 1};
	int pc[] = {-1, 1, 0, 0};
	boolean flag[][];
	char map[][];
	
	private int traverse(int r, int c) {
		int ret = 0;
		int tr = 0;
		int tc = 0;
		for ( int k = 0; k < 4; k++ ) {
			tr = r + pr[k];
			tc = c + pc[k];
			if ( map[tr][tc] == '.' && !flag[tr][tc] )
			ret += traverse(r + pr[k], c + pc[k]);
		}
		flag[tr][tc] = true;
		return ret;
	}
	
	public Test() {
		Scanner scan = new Scanner(System.in);
		int R = scan.nextInt();
		int C = scan.nextInt();
		
		map = new char[R][C];
		flag = new boolean[R][C];
		for ( boolean[] row: flag )
		Arrays.fill(row, false);
		
		for ( int r = 1; r <= R; r++ ) {
			String row = scan.next();
			map[r] = row.toCharArray();
		}
		
		int sR = 0, sC = 0;
		for ( int r = 1; r <= R; r++ )
		for ( int c = 1; c <= C; c++ )
		if ( map[r][c] == 'S' ) { sR = r; sC = c; }

		System.out.println( traverse(sR,sC) );

	}
	
	public static void main(String[] args) {
		new Test();
	}
		

}
