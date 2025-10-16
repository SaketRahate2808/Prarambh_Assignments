1] DECLARE
      Principal NUMBER(10,2) := 1000;
      Rate NUMBER(4,2) := 2.843;
      Time NUMBER(4) := 32;
      SI NUMBER;
      
      BEGIN
      SI := (Principal * Rate * Time) / 100;
      DBMS_OUTPUT.PUT_LINE('Simple Interest is '|| SI);
      
      END;


2] DECLARE
    emp_name VARCHAR2(50);
    Salary NUMBER(7);
    Bonus NUMBER (3);
    
    BEGIN 
        emp_name := 'Riya';
        Salary := 8930;
        
        IF Salary > 5000 THEN
            Bonus := 0.10 * Salary;
            DBMS_OUTPUT.PUT_LINE('The bonus is:  ' || Bonus);
            DBMS_OUTPUT.PUT_LINE('The salary is:  ' || Salary);
            DBMS_OUTPUT.PUT_LINE('The person is:  ' || emp_name);
        ELSE
             Bonus := 0.15 * Salary;
            DBMS_OUTPUT.PUT_LINE('The bonus is:  ' || Bonus);
            DBMS_OUTPUT.PUT_LINE('The salary is:  ' || Salary);
            DBMS_OUTPUT.PUT_LINE('The person is:  ' || emp_name);
             END IF;
             END;


3] DECLARE 
    v_dept DEPT%ROWTYPE;
    v_dept_id NUMBER(2) := 40;
    BEGIN
        SELECT DeptNo,DName,Loc INTO v_dept FROM Dept WHERE DeptNo = v_dept_id;
        DBMS_OUTPUT.PUT_LINE('Department names and the location mentioned are '|| v_dept.DeptNo ||' ' || v_dept.DName || ' ' || v_dept.Loc );
        END;

4] DECLARE
    TYPE average_score IS TABLE OF NUMBER
    INDEX BY VARCHAR2(50);
    
    avg_stud_score average_score;
    v_student_name VARCHAR(50);
    v_student_count NUMBER := 0;
    Totalmarks NUMBER := 0;
    AvgMarks NUMBER;
    
    BEGIN
        avg_stud_score('Krishi') := 87;
        avg_stud_score('Hemant') := 76;
        avg_stud_score('Lata') := 93;
        avg_stud_score('Maya') := 87;
        avg_stud_score('Aryan') := 88;

        v_student_name := avg_stud_score.FIRST;
        
        WHILE v_student_name IS NOT NULL LOOP
            DBMS_OUTPUT.PUT_LINE('Name: ' || RPAD(v_student_name, 15) || '|Mark: ' || avg_stud_score(v_student_name));
            
            TotalMarks := TotalMarks + avg_stud_score(v_student_name);
            v_student_count := v_student_count + 1;
            
            v_student_name := avg_stud_score.NEXT(v_student_name);
        END LOOP;
        
        If v_student_count > 0 THEN
            AvgMarks := TotalMarks / v_student_count;
        
        DBMS_OUTPUT.PUT_LINE('Total marks sum ' || TotalMarks);
        DBMS_OUTPUT.PUT_LINE('Average marks  ' || Round(AvgMarks,2));
    END IF;
    END;


5] DECLARE
    TYPE country_capital_table IS TABLE OF VARCHAR2(50)
    INDEX BY VARCHAR2(50);
    
    country_capitals country_capital_table;
    v_country VARCHAR2(50);
    
    BEGIN
        country_capitals('India') := 'New Delhi';
        country_capitals('France') := ' Paris';
        country_capitals('Japan') := 'Tokyo';
        country_capitals(' Australia') := 'Canberra';
        country_capitals('Brazil') := 'Brasilia';
        country_capitals('Canada') := 'Ottawa';
        country_capitals('Germany') := 'Berlin';
        
        v_country := '&country';
        IF country_capitals.EXISTS(v_country) THEN
            DBMS_Output.PUT_LINE('The Capital of ' || v_country || ' is ' || country_capitals(v_country));
        ELSE
            DBMS_OUTPUT.PUT_LINE('Country Not Found');
            END IF;
        END;
