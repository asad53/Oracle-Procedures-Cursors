REM   Script: Session 01
REM   detail

CREATE TABLE invdepttable 
  (deptno,dname,onhand) 
  AS SELECT deptno,dname,onhand FROM inven,dept;

DECLARE 
  v_dept dept.deptno%TYPE; 
  v_departmentname dept.dname%TYPE; 
  v_onhand inven.onhand%TYPE; 
  CURSOR invdept1 IS 
    SELECT deptno,dname,onhand 
      FROM dept,inven; 
 BEGIN 
OPEN invdept1; 
 FETCH invdept1 INTO v_dept, v_departmentname, v_onhand; 
WHILE invdept1%FOUND LOOP 
  INSERT INTO invdepttable 
    VALUES(v_dept, v_departmentname, v_onhand); 
    dbms_output.put_line( 'Dept No Added:' || ' ' ||v_dept|| ' Dept Name Added: ' ||v_departmentname|| ' On Hand Added: ' ||v_onhand); 
  FETCH invdept1 INTO v_dept, v_departmentname, v_onhand; 
END LOOP; 
CLOSE invdept1; 
END; 
/

select * from invdepttable;

DECLARE 
v_deptno NUMBER(2); 
v_eno NUMBER(4); 
v_sal NUMBER(7,2); 
CURSOR empdept1 IS 
    SELECT deptno, empno,sal 
    FROM empcopy; 
BEGIN 
OPEN empdept1; 
 FETCH empdept1 INTO v_deptno, v_eno, v_sal; 
 WHILE empdept1%FOUND LOOP 
    IF v_deptno = 10 THEN 
     v_sal := v_sal + v_sal* .05; 
     UPDATE empcopy 
     SET sal = v_sal 
     WHERE empno = v_eno; 
     COMMIT; 
     dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' New Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
    ELSIF v_deptno = 20 THEN 
    v_sal := v_sal +v_sal* .075; 
     UPDATE empcopy 
     SET sal = v_sal 
     WHERE empno = v_eno; 
     COMMIT; 
    dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' New Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
    ELSIF v_deptno = 30 THEN 
    v_sal := v_sal +v_sal* .1; 
     UPDATE empcopy 
     SET sal = v_sal 
     WHERE empno = v_eno; 
     COMMIT; 
    dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' New Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
    ELSE 
    dbms_output.put_line( 'Not Among These 3 Dept Nos '||v_eno||' with deperatment '||v_deptno); 
    END IF; 
  FETCH empdept1 INTO v_deptno, v_eno, v_sal; 
 END LOOP; 
CLOSE empdept1; 
END; 
/

DECLARE 
v_deptno NUMBER(2); 
v_eno NUMBER(4); 
v_sal NUMBER(7,2); 
CURSOR empdept1 IS 
    SELECT deptno, empno,sal 
    FROM empcopy; 
BEGIN 
OPEN empdept1; 
 FETCH empdept1 INTO v_deptno, v_eno, v_sal; 
 WHILE empdept1%FOUND LOOP 
    IF v_deptno = 10 THEN 
     dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' OLD Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
     IF v_sal > 2000 
     THEN 
       v_sal := v_sal + v_sal* .06; 
            UPDATE empcopy 
            SET sal = v_sal 
            WHERE empno = v_eno; 
            COMMIT; 
 
       dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' New Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
     ELSE 
       v_sal := v_sal + v_sal* .07; 
                   UPDATE empcopy 
            SET sal = v_sal 
            WHERE empno = v_eno; 
            COMMIT; 
       dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' New Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
     END IF; 
    ELSIF v_deptno = 20 THEN 
    dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' OLD Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
     IF v_sal > 2500 
     THEN 
       v_sal := v_sal + v_sal* .05; 
                   UPDATE empcopy 
            SET sal = v_sal 
            WHERE empno = v_eno; 
            COMMIT; 
       dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' New Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
     ELSE 
       v_sal := v_sal + v_sal* .055; 
                   UPDATE empcopy 
            SET sal = v_sal 
            WHERE empno = v_eno; 
            COMMIT; 
       dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' New Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
     END IF; 
     ELSIF v_deptno = 30 THEN 
    dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' OLD Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
     IF v_sal > 1000 
     THEN 
       v_sal := v_sal + v_sal* .07; 
                   UPDATE empcopy 
            SET sal = v_sal 
            WHERE empno = v_eno; 
            COMMIT; 
       dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' New Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
     ELSE 
       v_sal := v_sal + v_sal* .065; 
                   UPDATE empcopy 
            SET sal = v_sal 
            WHERE empno = v_eno; 
            COMMIT; 
       dbms_output.put_line( 'EMPNO is: '||' '||v_eno||' New Salary For DeptNo:' || ' ' ||v_deptno|| ' is  ' ||v_sal); 
     END IF; 
    ELSE 
    dbms_output.put_line( 'Not Among These 3 Dept Nos '||v_eno||' with deperatment '||v_deptno); 
    END IF; 
  FETCH empdept1 INTO v_deptno, v_eno, v_sal; 
 END LOOP; 
CLOSE empdept1; 
END; 
/

DECLARE 
	TYPE t_ManagerTable IS TABLE OF employeez.manager_id%TYPE 
	  INDEX BY BINARY_INTEGER; 
	v_ManagerIdTable t_ManagerTable; 
	CURSOR c_Employee1 IS 
	  SELECT manager_id FROM employeez; 
	CURSOR c_Employee2 IS 
	  SELECT employee_id, salary FROM employeez 
	  FOR UPDATE OF salary; 
	v_ManagerId employeez.manager_id%TYPE; 
	v_EmployeeId employeez.employee_id%TYPE; 
	v_Salary employeez.salary%TYPE; 
	v_FoundFlag BOOLEAN; 
	v_LoopCnt BINARY_INTEGER; 
	v_TableIndx BINARY_INTEGER; 
 
BEGIN 
	OPEN c_Employee1; 
	WHILE c_Employee1%NOTFOUND LOOP  
	  FETCH c_Employee1 INTO v_ManagerId; 
	  v_FoundFlag := FALSE; 
	  v_LoopCnt := 1; 
	  WHILE v_LoopCnt <= v_ManagerIdTable.COUNT LOOP 
	    IF v_ManagerId = v_ManagerIdTable(v_LoopCnt) THEN 
	      v_FoundFlag := TRUE; 
	      GOTO L1; 
	    END IF; 
	    v_LoopCnt := v_LoopCnt + 1; 
	  END LOOP; 
      <<L1>> 
	  IF v_FoundFlag = FALSE THEN 
	    v_ManagerIdTable(v_ManagerIdTable.COUNT + 1) := v_ManagerId; 
	  END IF; 
	END LOOP; 
	CLOSE c_Employee1; 
	OPEN c_Employee2; 
	WHILE  c_Employee2%NOTFOUND LOOP 
	  FETCH c_Employee2 INTO v_EmployeeId, v_Salary; 
	  v_FoundFlag := FALSE; 
	  v_LoopCnt := 1; 
	  WHILE v_LoopCnt <= v_ManagerIdTable.COUNT LOOP 
	    IF v_EmployeeId = v_ManagerIdTable(v_LoopCnt) THEN 
	      v_FoundFlag := TRUE; 
	      GOTO L2; 
	    END IF; 
	    v_LoopCnt := v_LoopCnt + 1; 
	  END LOOP; 
      <<L2>> 
	  IF v_FoundFlag = TRUE THEN 
	    v_Salary := 1.1 * v_Salary; 
	  ELSE 
	    v_Salary := 1.02 * v_Salary; 
	  END IF; 
	  UPDATE employeez 
	    SET salary = v_Salary 
	    WHERE CURRENT OF c_Employee2; 
	END LOOP; 
	CLOSE c_Employee2; 
	COMMIT; 
END; 
/

