/*
Guardar una imagen en base de datos
*/
CREATE OR REPLACE DIRECTORY IMG AS 'C:/IMG';
CREATE OR REPLACE DIRECTORY IMG AS 'C:\sql_files\img\';
 GRANT READ, WRITE ON DIRECTORY IMG TO HR;
 COMMIT;
 
SET SERVEROUTPUT ON;



 
 /* Almacenar archivo  en base de datos oracle */
DECLARE
     V_ARCHIVO BFILE := BFILENAME('IMG','1.JPG');
     MENSAJE VARCHAR2(100);
 BEGIN
    INSERT INTO IMAGENES VALUES(SQ_IMAGENES.NEXTVAL, 'TIGRE.JPG',EMPTY_BLOB() )
    INSERT INTO IMAGENES VALUES(SQ_IMAGENES.NEXTVAL, 'DOG.JPG',EMPTY_BLOB() )
                                 RETURN ARCHIVO INTO V_IMAGEN;
                                 
    DBMS_LOB.DBMS_LOB.FILEOPEN(V_FILE, DBMS_LOB.LOB_READONLY);
   DBMS_LOB.FILEOPEN(V_ARCHIVO, DBMS_LOB.LOB_READONLY);
     
    DBMS_LOB.DBMS_LOB.LOADFROMFILE(V_IMAGEN, V_ARCHIVO, DBMS_LOB.DBMS_LOB.GETLENGTH(V_ARCHIVO));
    DBMS_LOB.LOADFROMFILE(V_IMAGEN, V_ARCHIVO, DBMS_LOB.GETLENGTH(V_ARCHIVO));
     
    DBMS_LOB.DBMS_LOB.FILECLOSE(V_ARCHIVO);
    DBMS_LOB.FILECLOSE(V_ARCHIVO);
     COMMIT;
     
 EXCEPTION
 WHEN OTHERS THEN --Encuentra cualquier error
    MENSAJE := SQLERM;
    MENSAJE := SQLERRM;
     DBMS_OUTPUT.PUT_LINE(MENSAJE);
     DBMS_LOB.FILECLOSE(V_ARCHIVO);
 END;
 /
 
 SELECT * FROM IMAGENES;
