package com.dv.action;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.rosuda.JRI.Rengine;

import com.dv.action.base.DataSourceBaseAction;
import com.dv.entity.Dbdataset;
import com.dv.entity.Filedataset;
import com.dv.util.FileDatasetDetailBean;
import com.dv.util.JudgeString;
import com.dv.util.PageUtil;
import com.dv.util.StaticData;
import com.dv.util.ToolsFactory;
import com.opensymphony.xwork2.ActionContext;


@SuppressWarnings("serial")
public class DataSourceAction extends DataSourceBaseAction {

    private String sid;
    private String user;
    private String datasetname;
    private String separator;
    private String hasheadline;
    private String missing;
    private String fileName;
    private String filePath;
    private String fileSize;
    private double filedatasize;
    private List<Filedataset> allFileDatasets;
    private int totalrow;
    private List<FileDatasetDetailBean> fddBeans = new ArrayList<FileDatasetDetailBean>();
    private String[][] datashow;
    private double[][] statData;
    private String[][] statName;
    private String dbtype;
    private String dbname;
    private List<String> allDbtype;
    private List<Dbdataset> dbdatasetList;
    private String picture;//是否画图
    private String[] datacolnames;

    public String upload() {
        if (missing.equals("")) missing = "无缺失值";
        dsservice.addFileDataset(datasetname, fileName, fileSize, filePath, separator, hasheadline, missing, user);
        ActionContext.getContext().put("message", "数据集上传成功！");
        return SUCCESS;
    }

    public String fileDatasetList() {
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String, Object> session = ActionContext.getContext().getSession();
        user= (String) session.get("username");
        int totalNum = dsservice.getTotalFileDataset(user);
        String spageno = request.getParameter("pageno");
        PageUtil pu = new PageUtil(spageno, totalNum, 10);
        request.setAttribute("pu", pu);
        
        System.out.println(user);
        allFileDatasets = dsservice.fileDatasetList(pu.getPageno(), pu.getPagesize(), user);
        return SUCCESS;
    }

    


    @SuppressWarnings({"deprecation"})
    public String readFileDataset() {
        HttpServletRequest request = ServletActionContext.getRequest();
        Filedataset fd = dsservice.getById(sid);
        datasetname = fd.getDatasetname();
        fileName = fd.getFilename();
        separator = fd.getSeparate();
        hasheadline = fd.getHasheadline();
        missing = fd.getMissing();
        filedatasize = Double.parseDouble(fd.getFilesize());
        String filePath = (request.getRealPath("/datasets") + "\\" + fd.getFilepath()).replace("\\", "/");
        Map<String, Object> session = ActionContext.getContext().getSession();
        
        session.remove("filepath");
        session.put("filepath", filePath);
        session.remove("datasetname");
        session.put("datasetname",datasetname);
        session.remove("fileName");
        session.put("fileName",fileName);
        session.remove("missing");
        session.put("missing", missing);
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;

        c.eval("rm(list=ls()");

		/*if(missing==null)
        {
			c.eval("data<-read.table('"+filePath+"',header="+hasheadline+",sep='')");
		}*/
        if (filedatasize < 4) {
            System.out.println("read.table");
            picture = "true";
            c.eval("data<-read.table('" + filePath + "',header=" + hasheadline + ",sep='" + separator + "',fileEncoding='UTF-8-BOM')");
            //file 指定读入的文件  header 是否有列名（默认无） sep 指定分隔符(空格、TAB、换行符、回车符)
            c.eval("{rcolname<-names(data);dim(rcolname)<-c(length(names(data)))}");
            //查看变量的维数，重新设置的维数
            String colnames[] = c.eval("rcolname").asStringArray();
            
            datacolnames = new String[colnames.length + 1];
            for (int i = 0; i <= colnames.length; i++) {
                if (i == 0) {
                    datacolnames[i] = "序号";
                } else {
                    datacolnames[i] = colnames[i - 1];
                    System.out.println("变量名："+datacolnames[i]);
                }
            }
            //Map<String,Object> session=ActionContext.getContext().getSession();
            session.remove("colnames");
            session.put("colnames", colnames);
            String coltypes[] = ToolsFactory.getColType(filePath, hasheadline, separator, missing, colnames.length);
            session.remove("coltypes");
            for(int i=0;i<coltypes.length;i++){
            	String put = "coltypes["+i+"]";
            	session.put("+put+", coltypes[i]);
            }
            session.put("coltypes",coltypes);
            
            session.remove("picture");
            session.put("picture", picture);
            int missingnum[] = new int[colnames.length];
            double missingratio[] = new double[colnames.length];
            totalrow = c.eval("length(data[,1])").asInt();
            session.remove("totalrow");
            session.put("totalrow",totalrow);
            System.out.println("totalrow");
            System.out.println(session);
            DecimalFormat df = new DecimalFormat("##.##");

            if (!missing.equals("无缺失值")) {
                for (int i = 0; i < colnames.length; i++) {
                    c.eval("data[," + (i + 1) + "][data[," + (i + 1) + "]=='" + missing + "']=NA");
                    missingnum[i] = c.eval("sum(is.na(data[," + (i + 1) + "]))").asInt();//is.na检测缺失数据的函数，如果返回值为真（True）则说明此数据是缺失数据，如果
                    //返回值为假（False），则此数据不是缺失数据
                    missingratio[i] = (double) missingnum[i] / (double) totalrow;
                }
            } else {
                for (int i = 0; i < colnames.length; i++) {
                    missingnum[i] = 0;
                    missingratio[i] = 0.00;
                }
            }
            //数据集各字段基本信息
            for (int i = 0; i < colnames.length; i++) {
                FileDatasetDetailBean fddb = new FileDatasetDetailBean();
                fddb.setColname(colnames[i]);
                fddb.setColtype(coltypes[i].equals("S") ? "字符型" : "数值型");
                fddb.setMissingnum(missingnum[i]);
                fddb.setMissingratio(df.format(missingratio[i] * 100) + "%");
                //fddb.setMissingratio(Double.toString(missingratio[i]));
                fddBeans.add(fddb);
            }
            //分页显示数据集
            datashow = new String[30 >= totalrow ? totalrow : 30][colnames.length];
            for (int i = 0; i < (30 >= totalrow ? totalrow : 30); i++) {
                for (int j = 0; j < colnames.length; j++) {
                    datashow[i][j] = c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])").asString();
                    System.out.println(c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])"));
                    //as.character 转化为字符
                }
            }
        } else if (filedatasize >= 4 && filedatasize <= 500) {
        	System.out.println("12345");
        	System.out.println("R语言"+c.eval("library('ff')"));
            System.out.println("read.table.ffdf");
            picture = "false";
            c.eval("library('ff')");
            if (!missing.equals("无缺失值")) {
                if (fd.getFiletype().equals("txt")) {
                	//c.eval("library('ff')");
                    c.eval("data<-read.table.ffdf(file='" + filePath + "',header=" + hasheadline + ",sep='" + separator + "',fileEncoding='UTF-8-BOM',first.rows=100,next.rows=5000,na.strings='" + missing + "')");
                    //read.table.ffdf 读取文件数据
                } else if (fd.getFiletype().equals("csv")) {
                	//c.eval("library('ff')");
                	c.eval("data<-read.csv.ffdf(file='" + filePath + "',header=" + hasheadline + ",sep='" + separator + "',fileEncoding='UTF-8-BOM',first.rows=100,next.rows=5000,na.strings='" + missing + "')");
                }
            } else {
                if (fd.getFiletype().equals("txt")) {
                	//c.eval("library('ff')");
                	c.eval("data<-read.table.ffdf(file='" + filePath + "',header=" + hasheadline + ",sep='" + separator + "',fileEncoding='UTF-8-BOM',first.rows=100,next.rows=5000,na.strings='')");
                } else if (fd.getFiletype().equals("csv")) {
                	c.eval("library('ffbase')");
                	c.eval("data<-read.csv.ffdf(file='" + filePath + "',header=" + hasheadline + ",sep='" + separator + "',fileEncoding='UTF-8-BOM',first.rows=100,next.rows=5000,na.strings='')");
                }
            }
            System.out.println(c.eval("summary(data)"));
            c.eval("{rcolname<-names(data);dim(rcolname)<-c(length(names(data)))}");
            System.out.println(c.eval("{rcolname<-names(data);dim(rcolname)<-c(length(names(data)))}"));
            String colnames[] = c.eval("rcolname").asStringArray();
            datacolnames = new String[colnames.length + 1];
            for (int i = 0; i <= colnames.length; i++) {
                if (i == 0) {
                    datacolnames[i] = "序号";
                } else {
                    datacolnames[i] = colnames[i - 1];
                }
            }
            //Map<String,Object> session=ActionContext.getContext().getSession();
            session.remove("colnames");
            session.put("colnames", colnames);
            String coltypes[] = ToolsFactory.getColType(filePath, hasheadline, separator, missing, colnames.length);
            session.remove("coltypes");
            session.put("coltypes", coltypes);
            session.remove("picture");
            session.put("picture", picture);
            int missingnum[] = new int[colnames.length];
            double missingratio[] = new double[colnames.length];
            totalrow = c.eval("length(data[,1])").asInt();
            session.remove("totalrow");
            session.put("totalrow",totalrow);
            DecimalFormat df = new DecimalFormat("##.##");

            if (!missing.equals("无缺失值")) {
                for (int i = 0; i < colnames.length; i++) {
                    //c.eval("data[,"+(i+1)+"][data[,"+(i+1)+"]=='"+missing+"']=NA");
                    missingnum[i] = c.eval("sum(is.na(data[," + (i + 1) + "]))").asInt();
                    missingratio[i] = (double) missingnum[i] / (double) totalrow;
                }
            } else {
                for (int i = 0; i < colnames.length; i++) {
                    missingnum[i] = 0;
                    missingratio[i] = 0.00;
                }
            }
            for (int i = 0; i < colnames.length; i++) {
                FileDatasetDetailBean fddb = new FileDatasetDetailBean();
                fddb.setColname(colnames[i]);
                fddb.setColtype(coltypes[i].equals("S") ? "字符型" : "数值型");
                fddb.setMissingnum(missingnum[i]);
                fddb.setMissingratio(df.format(missingratio[i] * 100) + "%");
                //fddb.setMissingratio(Double.toString(missingratio[i]));
                fddBeans.add(fddb);
            }
            //分页显示数据集
            datashow = new String[30 >= totalrow ? totalrow : 30][colnames.length];
            for (int i = 0; i < (30 >= totalrow ? totalrow : 30); i++) {
                for (int j = 0; j < colnames.length; j++) {
                    datashow[i][j] = c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])").asString();
                    System.out.println(datashow[i][j]);
                }
            }
        } else {
            picture = "false";
        }

        return SUCCESS;
    }
    public String statShow(){
    	HttpServletRequest request = ServletActionContext.getRequest();
    	StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        c.eval("{rcolname<-names(data);dim(rcolname)<-c(length(names(data)))}");
    	String colnames[] = c.eval("rcolname").asStringArray();
    	//String index[] = c.eval("names(table(data[,1]))").asStringArray();
    	//System.out.println(index[0]);
    	System.out.println(colnames.length);
    	//String[][] index = null;
    	//double[][] num = null;
    	totalrow = c.eval("length(data[,1])").asInt();
    	String[][] Name = new String[colnames.length][];
    	double[][] Data = new double[colnames.length][];
    	statName = new String[colnames.length][];
    	statData = new double[colnames.length][];
    	//System.out.println(statName.length);
    	for(int i=0 ; i<colnames.length;i++){
    		 String index[]= c.eval("names(table(data[," + (i + 1) + "]))").asStringArray();
    		 System.out.println(index.length);
    		 Name[i] = new String[index.length];
    		 Name[i] = index;
    		 
    		  double num[]= c.eval("as.numeric(table(data[," + (i + 1) + "]))").asDoubleArray();
    		  Data[i] = new double[num.length];
    		  Data[i] = num;	    
    	}
    	JudgeString js = new JudgeString();
    	for(int i=0;i<Name.length;i++){
    		if(!js.isNumeric(Name[i][0])){
    			statName[i] = new String[Name[i].length];
    			statName[i] = Name[i];
    			statData[i] = new double[Data[i].length];
    			statData[i] = Data[i];
    			continue;
    		}
    		double maxn = Double.parseDouble(Name[i][0]);
    		double minn = Double.parseDouble(Name[i][0]);
    		for(int j=0;j<Data[i].length;j++){
    			if(!js.isNumeric(Name[i][j])){
    				continue;
    			}
    			double now = Double.parseDouble(Name[i][j]);
    			if(now>maxn) maxn = now;
    			if(now<minn) minn = now;
    			//System.out.println("maxn"+maxn+"minn"+minn+"now"+now+"data"+j);
    		}
    		maxn = Math.ceil(maxn);
    		minn = Math.floor(minn);
    		System.out.println(maxn+" "+ minn);
    		double range = maxn-minn;
    		int large = 0;
    		DecimalFormat df = new DecimalFormat("###.0");
    		double step = 0;
    		if(range>=12.0) {
    			step = (maxn - minn)/12.0;
    			large = 12;
    			df.format(step);
    		}
    		else if(range!=0){
    			step = (maxn-minn)/10.0;
    			large = 10;
    		}
    		else if(range==0){
    			step = 0;
    			large = 2;
    		}
    		System.out.println(large+"large"+"step"+step);
    		double[] newNumber = new double[large];
    		String[] detail = new String[large];
    		detail[0] = Double.parseDouble(df.format(minn))+"~"+Double.parseDouble(df.format(minn+step));
    		detail[large-1] = Double.parseDouble(df.format(minn+(large-1)*step))+"~"+Double.parseDouble(df.format(maxn));
    		for(int k=1;k<large-1;k++){
    			detail[k] = Double.parseDouble((df.format(minn+k*step)))+"~"+Double.parseDouble((df.format(minn+(k+1)*step)));
    			System.out.println(detail[k]);
    		}
    		for(int j=0;j<Name[i].length;j++){
    			if(!js.isNumeric(Name[i][j])){
    				continue;
    			}
    			double now = Double.parseDouble(Name[i][j]);
    			
    			int index = (int)Math.floor((now-minn)/step);
    			if(index*step==now-minn&&index>0) index -=1;
    			
    			System.out.println(index+" "+large+" "+now+" "+minn+" "+maxn);
    			newNumber[index]+=Data[i][j];
    		}
    		statName[i] = new String[Name[i].length];
			statName[i] = detail;
			statData[i] = new double[Data[i].length];
			statData[i] = newNumber;
    		
    	}
    	datacolnames = colnames;
    	return SUCCESS;
    }
    public String dataListShow() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String spageno = request.getParameter("pageno");
        System.out.println(spageno);
        PageUtil pu = new PageUtil(spageno, totalrow, 40);
        request.setAttribute("pu", pu);
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        c.eval("{rcolname<-names(data);dim(rcolname)<-c(length(names(data)))}");
        String colnames[] = c.eval("rcolname").asStringArray();

        String biaotou = "";
        String tablebody = "";
        String tablecontent = "";

        //分页显示数据集
        int num = 40 * Integer.parseInt(spageno) >= totalrow ? (totalrow - 40 * (Integer.parseInt(spageno) - 1)) : 40;
        datashow = new String[num][colnames.length];
        for (int i = 0; i < num; i++) {
            for (int j = 0; j < colnames.length; j++) {
                datashow[i][j] = c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])").asString();
            }
        }
        
        biaotou += "<th nowrap>序号</th>";
        for (int i = 0; i < colnames.length; i++) {
            biaotou += "<th nowrap>" + colnames[i] + "</th>";
        }
        biaotou = "<thead><tr class='theadstyle'>" + biaotou + "</tr></thead>";

        for (int i = 0; i < num; i++) {
            tablebody = tablebody + "<tr><td>" + (40 * (Integer.parseInt(spageno) - 1) + i + 1) + "</td>";
            for (int j = 0; j < colnames.length; j++) {
                tablebody = tablebody + "<td>" + datashow[i][j] + "</td>";
            }
            tablebody = tablebody + "</tr>";
        }

        tablecontent = "<table width='100%' class='table table-hover'>" + biaotou + tablebody + "</table>";
        request.setAttribute("tablecontent", tablecontent);
        return SUCCESS;
    }
    public String allDbType() {
        allDbtype = dsservice.allDbType();
        return SUCCESS;
    }

    public String getDbName() {
        allDbtype = dsservice.getDbName(dbtype);
        return SUCCESS;
    }

   /* public String getTableName() {
        String[] t = dbname.split(",");
        HttpServletRequest request = ServletActionContext.getRequest();
        int totalNum = dsservice.getTotalTable(t[0], t[1]);
        String spageno = request.getParameter("pageno");
        PageUtil pu = new PageUtil(spageno, totalNum, 10);
        request.setAttribute("pu", pu);
        dbdatasetList = dsservice.getTableName(pu.getPageno(), pu.getPagesize(), t[0], t[1]);
        return SUCCESS;
    }
	*/
    @SuppressWarnings("deprecation")
    public String readDbDataset() {
        picture = "true";
        Dbdataset dd = dsservice.getDbById(sid);
        dbtype = dd.getDbtype();
        dbname = dd.getDbname();
        String tablename = dd.getTablename();
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        HttpServletRequest request = ServletActionContext.getRequest();
        String jarpath = request.getRealPath("/").replace("\\", "/");
        System.out.println(jarpath);

        c.eval("rm(list=ls()");

        if (dbtype.equals("mysql")) {
            c.eval("{library(RJDBC);" +
                    "drv = JDBC('com.mysql.jdbc.Driver', '" + jarpath + "WEB-INF/lib/mysql-connector-java-5.1.13-bin.jar');" +
                    "conn = dbConnect(drv, 'jdbc:mysql://127.0.0.1/" + dbname + "', 'root', '123456');" +
                    "data<- dbReadTable(conn, '" + tablename + "');" +
                    "}");

        } else if (dbtype.equals("sqlserver")) {
            c.eval("{library(RJDBC);" +
                    "drv = JDBC('com.microsoft.sqlserver.jdbc.SQLServerDriver', '" + jarpath + "WEB-INF/lib/sqljdbc4.jar');" +
                    "conn = dbConnect(drv, 'jdbc:sqlserver://127.0.0.1:1433;databaseName=" + dbname + "', 'sa', '123456');" +
                    "data<- dbReadTable(conn, '" + tablename + "');" +
                    "}");
        }
        c.eval("{rcolname<-names(data);dim(rcolname)<-c(length(names(data)))}");
        String colnames[] = c.eval("rcolname").asStringArray();
        datacolnames = new String[colnames.length + 1];
        for (int i = 0; i <= colnames.length; i++) {
            if (i == 0) {
                datacolnames[i] = "序号";
            } else {
                datacolnames[i] = colnames[i - 1];
            }
        }
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.remove("colnames");
        session.put("colnames", colnames);
        String coltypes[] = new String[colnames.length];
        for (int i = 0; i < coltypes.length; i++) {
            coltypes[i] = c.eval("class(data[," + (i + 1) + "])").asString();
        }
        session.remove("coltypes");
        session.put("coltypes", coltypes);
        session.remove("picture");
        session.put("picture", picture);
        int missingnum[] = new int[colnames.length];
        double missingratio[] = new double[colnames.length];
        totalrow = c.eval("length(data[,1])").asInt();
        DecimalFormat df = new DecimalFormat("##");
        for (int i = 0; i < colnames.length; i++) {
            missingnum[i] = c.eval("sum(is.na(data[," + (i + 1) + "]))").asInt();
            missingratio[i] = (double) missingnum[i] / (double) totalrow;
        }

        for (int i = 0; i < colnames.length; i++) {
            FileDatasetDetailBean fddb = new FileDatasetDetailBean();
            fddb.setColname(colnames[i]);
            fddb.setColtype(coltypes[i]);
            fddb.setMissingnum(missingnum[i]);
            fddb.setMissingratio(df.format(missingratio[i] * 100) + "%");
            //fddb.setMissingratio(Double.toString(missingratio[i]));
            fddBeans.add(fddb);
        }
        //分页显示数据集
        datashow = new String[30 >= totalrow ? totalrow : 30][colnames.length];
        for (int i = 0; i < (30 >= totalrow ? totalrow : 30); i++) {
            for (int j = 0; j < colnames.length; j++) {
                datashow[i][j] = c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])").asString();
            }
        }
        return SUCCESS;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }
    
    public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getDatasetname() {
        return datasetname;
    }

    public void setDatasetname(String datasetname) {
        this.datasetname = datasetname;
    }

    public String getSeparator() {
        return separator;
    }

    public void setSeparator(String separator) {
        this.separator = separator;
    }

    public String getHasheadline() {
        return hasheadline;
    }

    public void setHasheadline(String hasheadline) {
        this.hasheadline = hasheadline;
    }

    public String getMissing() {
        return missing;
    }

    public void setMissing(String missing) {
        this.missing = missing;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public List<Filedataset> getAllFileDatasets() {
        return allFileDatasets;
    }

    public void setAllFileDatasets(List<Filedataset> allFileDatasets) {
        this.allFileDatasets = allFileDatasets;
    }

    public int getTotalrow() {
        return totalrow;
    }

    public void setTotalrow(int totalrow) {
        this.totalrow = totalrow;
    }

    public List<FileDatasetDetailBean> getFddBeans() {
        return fddBeans;
    }

    public void setFddBeans(List<FileDatasetDetailBean> fddBeans) {
        this.fddBeans = fddBeans;
    }

    public String getDbtype() {
        return dbtype;
    }

    public void setDbtype(String dbtype) {
        this.dbtype = dbtype;
    }

    public String getDbname() {
        return dbname;
    }

    public void setDbname(String dbname) {
        this.dbname = dbname;
    }

    public List<String> getAllDbtype() {
        return allDbtype;
    }

    public void setAllDbtype(List<String> allDbtype) {
        this.allDbtype = allDbtype;
    }

    public List<Dbdataset> getDbdatasetList() {
        return dbdatasetList;
    }

    public void setDbdatasetList(List<Dbdataset> dbdatasetList) {
        this.dbdatasetList = dbdatasetList;
    }

    public String[][] getDatashow() {
        return datashow;
    }

    public void setDatashow(String[][] datashow) {
        this.datashow = datashow;
    }

    public String[] getDatacolnames() {
        return datacolnames;
    }

    public void setDatacolnames(String[] datacolnames) {
        this.datacolnames = datacolnames;
    }

	public double[][] getStatData() {
		return statData;
	}

	public void setStatData(double[][] statData) {
		this.statData = statData;
	}

	public String[][] getStatName() {
		return statName;
	}

	public void setStatName(String[][] statName) {
		this.statName = statName;
	}
    
}
