SELECT TO_CHAR(Date_Performed, 'YYYY-MM') AS Label,
       COUNT(*)                           AS Value
FROM   EMCT_MAINTENANCE_LOGS
WHERE  Date_Performed >= ADD_MONTHS(TRUNC(SYSDATE), -12)
GROUP  BY TO_CHAR(Date_Performed, 'YYYY-MM')
ORDER  BY Label
