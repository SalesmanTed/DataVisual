package com.dv.action;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.rosuda.JRI.Rengine;

import com.dv.action.base.DataMiningBaseAction;
import com.dv.util.Export_excelBean;
import com.dv.util.Export_imageBean;
import com.dv.util.StaticData;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class Cluster extends DataMiningBaseAction {
    private String ids;
    private String center;//kmeans,clara,pam
    private String itermax;//kmeans
    private String nstart;//kmeans
    private String algorithm;//kmeans
    private String savaPath;
    private String imagename;
    private String imagename1;
    private String result;
    private List<Export_excelBean> excellist = null;
    private List<Export_imageBean> imagelist = null;
    private String[] existData;
    private List<Map<String, String>> matrixdata;//散点矩阵图数据
    private String[][] datashow;//平行坐标图数据
    private String[] deleteData;
    private int[] clustertype = null;//每一类标识
    private int clustersize[] = null;//每类数目
    private String[] dimensions = null;
    private String[] typename = null;
    private String sample[] = null;
    private double centers[][] = null;
    private double medoids[][] = null;
    private double clusinfo[][] = null;


    @SuppressWarnings("deprecation")
    public String getSavaPath() {
        return ServletActionContext.getRequest().getRealPath(savaPath);
    }

    public void setSavaPath(String savaPath) {
        this.savaPath = savaPath;
    }

    public String Kmeans() {
        String imagepath = getSavaPath().replace("\\", "//") + "//";
        System.out.println(imagepath);
        imagename = "result" + new Date().getTime() + ".png";
        imagename1 = "result1" + new Date().getTime() + ".png";
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        Map<String, Object> session = ActionContext.getContext().getSession();
        String coltypes[] = (String[]) session.get("coltypes");
        System.out.println(ids);
        String colids[] = ids.split(",");
        int[] col = new int[colids.length];
        for(int i=0;i<colids.length;i++){
        	col[i] = Integer.parseInt(colids[i])-1;
        }
        String colnames[] = (String[]) session.get("colnames");
        String index="";
        int cou=0;
        int total = 0;
        for(int i=0;i<col.length;i++){
        	System.out.println(i);
        	System.out.println(coltypes[i]);
        	if(coltypes[col[i]]=="N"){
        		total++;
        		continue;
        	}
        	else{
        		System.out.println(coltypes[col[i]]);
        		
        			
        		
        		
        		//index +=","+(i+1);
        		cou++;
        	}
        }
        deleteData = new String [cou];
       
        existData = new String[total];
        int num =0;
        int num1 =0;
        int[] delete= new int[cou];
        for(int i=0;i<col.length;i++){
        	if(coltypes[col[i]]=="N"){
        		existData[num1] = colnames[col[i]];
        		num1++;
        		continue;
        	}
        	else{
        		delete[num] = col[i];
        		deleteData[num] = colnames[col[i]];
        		System.out.println(deleteData[num]);
        		num++;
        	}
        }
        //c.eval("data=data[,c("+index+")]");
        for(int i=0;i<colids.length;i++){
        	col[i] = Integer.parseInt(colids[i]);
        }
        for(int i=0;i<col.length;i++){
        	for(int j=0;j<delete.length;j++){
        		if(col[i]==(delete[j]+1)){
        			col[i]=0;
        			break;
        		}
        		
        	}
        }
        String idscopy = ids;
        ids ="";
        for(int i=0;i<col.length;i++){
        	if(col[i]!=0){
        		ids+=col[i]+",";
        	}
        }
        if(ids.length()==0){
        	result="该数据集不存在可以进行该分析的变量，本分析针对数值型变量，请重新选择数据集";
        	return "kmeans";
        }
        ids=ids.substring(0, ids.length()-1);
        System.out.println(ids);        //c.eval("kc<-kmeans(x=na.omit(data[,c("+ids+")]),centers="+center+",iter.max="+itermax+",nstart="+nstart+",algorithm=c('"+algorithm+"'));");
        if(ids.equals(idscopy)){
    		result = "成功";
    	}
    	else {
    		result="其他符合要求变量已成功加入分析算法中，结果如下";
    	}
        c.eval("kc<-kmeans(x=na.omit(data[,c(" + ids + ")]),centers=" + center + ",iter.max=" + itermax + ");");

        clustertype = c.eval("kc$cluster").asIntArray();

        String idarray[] = ids.split(",");
        
        int totalrow = c.eval("length(data[,1])").asInt();
        dimensions = new String[idarray.length];
        for (int i = 0; i < idarray.length; i++) {
            dimensions[i] = colnames[Integer.parseInt(idarray[i]) - 1];
        }
        typename = new String[Integer.parseInt(center)];
        for (int i = 1; i <= Integer.parseInt(center); i++) {
            typename[i - 1] = "聚类簇" + i;
        }
        datashow = new String[totalrow + 1][idarray.length + 1];
        for (int i = 0; i < idarray.length + 1; i++) {
            if (i == idarray.length) {
                datashow[0][i] = "clustertype";
            } else {
                datashow[0][i] = colnames[Integer.parseInt(idarray[i]) - 1];
            }
        }

        //平行坐标图数据
        for (int i = 1; i <= totalrow; i++) {
            for (int j = 0; j < idarray.length + 1; j++) {
                if (j == idarray.length) {
                    datashow[i][j] = clustertype[i - 1] + "";
                } else {
                    datashow[i][j] = c.eval("as.character(data[" + i + "," + idarray[j] + "])").asString();
                }
            }
        }

        //散点矩阵图数据
        matrixdata = new ArrayList<Map<String, String>>();
        for (int i = 1; i <= totalrow; i++) {
            Map<String, String> maptemp = new HashMap<String, String>();
            for (int j = 0; j < idarray.length + 1; j++) {
                if (j == idarray.length) {
                    maptemp.put("clustertype", clustertype[i - 1] + "");
                } else {
                    maptemp.put(colnames[Integer.parseInt(idarray[j]) - 1], c.eval("as.character(data[" + i + "," + idarray[j] + "])").asString());
                }
            }
            matrixdata.add(maptemp);
        }

        DecimalFormat df = new DecimalFormat(".##");
        c.eval("{temp<-kc$size;dim(temp)<-c(length(kc$size))}");
        clustersize = c.eval("temp").asIntArray();
        for (int i = 0; i < clustersize.length; i++) {
            System.out.println(clustersize[i]);
        }
        //最佳中心点
        centers = c.eval("kc$centers").asDoubleMatrix();
        for (int i = 0; i < centers.length; i++) {
            for (int j = 0; j < centers[0].length; j++) {
                centers[i][j] = Double.parseDouble(df.format(centers[i][j]));
                System.out.print(centers[i][j] + " ");
            }
            System.out.println();
        }
        excellist = new ArrayList<Export_excelBean>();
        Export_excelBean ieb = new Export_excelBean();
        ieb.setArrayname("每簇聚类数目");
        ieb.setArray_E(clustersize);
        ieb.setArraytype("E");
        excellist.add(ieb);
        Export_excelBean ieb1 = new Export_excelBean();
        ieb1.setArrayname("最佳中心点");
        ieb1.setArray_D(centers);
        ieb1.setArraytype("D");
        excellist.add(ieb1);

        imagelist = new ArrayList<Export_imageBean>();
        Export_imageBean exportimage = new Export_imageBean();
        exportimage.setImageinfo("图1");
        exportimage.setImagepath(imagepath + imagename);
        imagelist.add(exportimage);

        session.remove("excellist");
        session.put("excellist", excellist);
        session.remove("imagelist");
        session.put("imagelist", imagelist);
        c.eval("rm('kc')");
        return "kmeans";
    }


    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public String getCenter() {
        return center;
    }

    public void setCenter(String center) {
        this.center = center;
    }

    public String getItermax() {
        return itermax;
    }

    public void setItermax(String itermax) {
        this.itermax = itermax;
    }

    public String getNstart() {
        return nstart;
    }

    public void setNstart(String nstart) {
        this.nstart = nstart;
    }

    public String getAlgorithm() {
        return algorithm;
    }

    public void setAlgorithm(String algorithm) {
        this.algorithm = algorithm;
    }

    public String getImagename() {
        return imagename;
    }

    public void setImagename(String imagename) {
        this.imagename = imagename;
    }

    public String[] getSample() {
        return sample;
    }

    public void setSample(String[] sample) {
        this.sample = sample;
    }

    public double[][] getCenters() {
        return centers;
    }

    public void setCenters(double[][] centers) {
        this.centers = centers;
    }

    public double[][] getMedoids() {
        return medoids;
    }

    public void setMedoids(double[][] medoids) {
        this.medoids = medoids;
    }

    public double[][] getClusinfo() {
        return clusinfo;
    }

    public void setClusinfo(double[][] clusinfo) {
        this.clusinfo = clusinfo;
    }

    public String getImagename1() {
        return imagename1;
    }

    public void setImagename1(String imagename1) {
        this.imagename1 = imagename1;
    }

    public int[] getClustersize() {
        return clustersize;
    }

    public void setClustersize(int[] clustersize) {
        this.clustersize = clustersize;
    }

    public String[][] getDatashow() {
        return datashow;
    }

    public void setDatashow(String[][] datashow) {
        this.datashow = datashow;
    }

    public int[] getClustertype() {
        return clustertype;
    }

    public void setClustertype(int[] clustertype) {
        this.clustertype = clustertype;
    }

    public String[] getDimensions() {
        return dimensions;
    }

    public void setDimensions(String[] dimensions) {
        this.dimensions = dimensions;
    }

    public String[] getTypename() {
        return typename;
    }

    public void setTypename(String[] typename) {
        this.typename = typename;
    }

    public List<Map<String, String>> getMatrixdata() {
        return matrixdata;
    }

    public void setMatrixdata(List<Map<String, String>> matrixdata) {
        this.matrixdata = matrixdata;
    }

	public String[] getDeleteData() {
		return deleteData;
	}

	public void setDeleteData(String[] deleteData) {
		this.deleteData = deleteData;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String[] getExistData() {
		return existData;
	}

	public void setExistData(String[] existData) {
		this.existData = existData;
	}
    

}
