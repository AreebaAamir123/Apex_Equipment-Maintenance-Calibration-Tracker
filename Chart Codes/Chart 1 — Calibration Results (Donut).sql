SELECT Result_Status AS Label,
       COUNT(*)      AS Value
FROM   EMCT_CALIBRATION_LOGS
GROUP  BY Result_Status
ORDER  BY Result_Status
