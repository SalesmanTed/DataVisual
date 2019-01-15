package com.dv.service;

import com.dv.entity.Dbdataset;
import com.dv.entity.Filedataset;

import java.util.List;


public interface DataSourceService {

    public void addFileDataset(String datasetName, String fileName, String fileSize, String filePath, String separator, String hasheadline, String missing, String user);

    public void  addDbDataset(String dbtype, String dbname, String tablename);
    
    public int getTotalFileDataset(String user);

    public List<Filedataset> fileDatasetList(int pageno, int pagesize, String user);

    public Filedataset getById(String sid);

    public List<String> allDbType();

    public List<String> getDbName(String dbtype);

    public int getTotalTable(String t0, String t1);

    public List<Dbdataset> getTableName(int pageno, int pagesize, String t0, String t1);

    public Dbdataset getDbById(String sid);

    public List<Object[]> getCols(String database, String table);
}
