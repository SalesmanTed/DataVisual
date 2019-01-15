var lang = ({
    cn: {
        errorInEditor: '编辑器内容有误！',
        chartOK: '图表已生成, '
    },
    en: {
        errorInEditor: 'Errors exist in code!',
        chartOK: 'Chart has been generated successfully, '
    }
})[window.EC_DEMO_LANG];



var configs = {};
var lnTools = ace.require('ace/ext/language_tools');

var keywords = {"grid": 108210,"series": 1161721,"pie": 173151,"legend": 278319,"right": 12224,"tooltip": 188049,"xAxis": 374619,"bar": 182040,"label": 163527,"emphasis": 50000,"formatter": 62138,"line": 306801,"data": 232156,"left": 24464,"top": 18094,"scatter": 48954,"type": 92134,"yAxis": 238764,"axisLabel": 73604,"legendHoverLink": 14243,"textStyle": 129159,"hoverAnimation": 9062,"dataZoom": 90999,"nameLocation": 15800,"nameTextStyle": 30596,"nameGap": 14640,"singleAxis": 15977,"splitLine": 30047,"nameRotate": 10483,"inverse": 12997,"boundaryGap": 18533,"clockwise": 4411,"lineStyle": 81857,"selectedOffset": 2984,"width": 17962,"slider": 28321,"dataBackground": 2287,"areaStyle": 19428,"color": 94439,"height": 7954,"orient": 17218,"align": 10373,"symbol": 35613,"xAxisIndex": 15405,"stack": 10602,"clipOverflow": 3229,"center": 9827,"padding": 12855,"itemStyle": 143518,"itemGap": 11914,"shadowBlur": 17233,"shadowColor": 13929,"normal": 211293,"borderColor": 20648,"shadowOffsetX": 11499,"shadowOffsetY": 9210,"opacity": 12301,"heatmap": 13825,"value": 21111,"fillerColor": 797,"borderWidth": 15576,"itemWidth": 7123,"effectScatter": 31179,"coordinateSystem": 15302,"axisLine": 53628,"axisTick": 38765,"selectedMode": 15177,"fontSize": 14906,"inactiveColor": 5720,"selected": 10921,"gauge": 55176,"markLine": 65539,"handleStyle": 1852,"borderType": 5717,"title": 158568,"show": 82000,"length": 4814,"zlevel": 22293,"labelPrecision": 746,"position": 48349,"labelFormatter": 727,"alignWithLabel": 3785,"interval": 28810,"showDetail": 694,"yAxisIndex": 10560,"showDataShadow": 591,"realtime": 2611,"onZero": 3690,"silent": 22883,"radar": 61070,"axisPointer": 23175,"trigger": 15344,"barCategoryGap": 3511,"splitNumber": 19992,"inside": 32482,"name": 61072,"showSymbol": 4778,"containLabel": 6413,"offset": 15619,"max": 12538,"backgroundColor": 32864,"visualMap": 95262,"fontStyle": 14443,"fontWeight": 11970,"fontFamily": 10141,"symbolSize": 21077,"blurSize": 360,"geo": 65283,"radius": 8533,"markArea": 19906,"map": 102385,"brush": 29508,"parallel": 20673,"parallelAxis": 13713,"gridIndex": 20650,"piecewise": 25231,"showContent": 6960,"zoom": 3997,"polar": 23175,"controller": 2892,"radiusAxis": 24146,"angleAxis": 18771,"toolbox": 101543,"timeline": 34619,"precision": 3306,"curveness": 1378,"x": 2753,"valueIndex": 2807,"itemHeight": 5180,"icon": 10336,"valueDim": 2013,"symbolOffset": 10017,"y": 1590,"transitionDuration": 3814,"radarIndex": 715,"extraCssText": 3640,"animation": 17864,"animationThreshold = 2000": 11727,"minInterval": 11278,"animationDelay": 7620,"layoutCenter": 2348,"animationDurationUpdate": 6972,"animationEasingUpdate": 6816,"animationDelayUpdate": 6642,"symbolRotate": 10221,"feature": 50238,"axis": 1794,"crossStyle": 1830,"funnel": 11042,"scaleLimit": 4792,"roam": 7112,"itemSize": 1966,"showTitle": 1851,"smooth": 5185,"saveAsImage": 9915,"showAllSymbol": 3417,"polarIndex": 5235,"graph": 76898,"layout": 2633,"excludeComponents": 447,"restore": 3693,"dataView": 10258,"magicType": 10505,"iconStyle": 9088,"nodeScaleRatio": 892,"hoverLayerThreshold": 6480,"textAlign": 9402,"splitArea": 16447,"nameMap": 4584,"text": 11691,"pixelRatio": 357,"readOnly": 491,"optionToContent": 936,"lang": 549,"textareaColor": 233,"textareaBorderColor": 177,"option": 2003,"seriesIndex": 4483,"back": 199,"rect": 323,"polygon": 254,"min": 16646,"scale": 14303,"logBase": 7456,"start": 2889,"z": 15867,"link": 5348,"textBaseline": 4210,"subtext": 5086,"sublink": 2618,"subtarget": 2373,"subtextStyle": 7732,"triggerEvent": 9175,"blendMode": 6359,"progressiveThreshold": 4699,"continuous": 42105,"lines": 31608,"markPoint": 81254,"roseType": 4221,"animationEasing": 8836,"animationDuration": 9562,"calculable": 3953,"progressive": 5761,"treemap": 16948,"links": 9573,"edgeSymbol": 1211,"bottom": 13969,"edges": 1122,"edgeLabel": 1685,"edgeSymbolSize": 769,"focusNodeAdjacency": 888,"draggable": 965,"force": 5601,"geoIndex": 2856,"circular": 1862,"avoidLabelOverlap": 3694,"target": 5476,"coord": 3995,"startValue": 2182,"triggerOn": 6741,"showDelay": 3535,"alwaysShowContent": 4928,"enterable": 3871,"hideDelay": 3018,"step": 3437,"detail": 5434,"startAngle": 5421,"handleIcon": 1051,"handleSize": 932,"zoomLock": 1979,"throttle": 1757,"boxplot": 6233,"candlestick": 14005,"sankey": 10101,"loop": 678,"rewind": 439,"controlStyle": 1269,"labelLine": 17838,"distance": 452,"rotate": 4666,"margin": 4342,"barWidth": 6641,"category": 1318,"barGap": 4832,"nodes": 2085,"pieces": 2683,"smoothMonotone": 2203,"itemSymbol": 882,"axisType": 902,"currentIndex": 583,"effectType": 1364,"areaColor": 2808,"showEffectOn": 1285,"rippleEffect": 3617,"minAngle": 2527,"barMaxWidth": 3073,"rotateLabel": 523,"dimension": 1922,"end": 1426,"inRange": 4604,"outOfRange": 2262,"checkpointStyle": 1036,"sampling": 2458,"regions": 6273,"large": 1055,"showLegendSymbol": 1600,"layoutSize": 1981,"mapValueCalculation": 1447,"categories": 4362,"indicator": 2995,"barBorderRadius": 1455,"range": 2009,"connectNulls": 3411,"pointer": 2665,"effect": 5446,"parallelAxisDefault": 927,"coords": 750,"shadowStyle": 1670,"largeThreshold": 754,"hoverLink": 1276,"repulsion": 865,"textGap": 1121,"breadcrumb": 828,"baseline": 1316,"endAngle": 895,"period": 1153,"brushType": 1421,"minOpacity": 216,"brushLink": 913,"brushMode": 465,"transformable": 418,"brushStyle": 507,"throttleType": 448,"throttleDelay": 369,"removeOnClick": 648,"inBrush": 500,"outOfBrush": 466,"offsetCenter": 981,"barMinHeight": 2279,"parallelIndex": 235,"nodeClick": 732,"source": 869,"color0": 210,"filterMode": 2252,"tiled": 352,"autoPlay": 496,"playInterval": 440,"sort": 484,"polyline": 929,"initLayout": 966,"controlPosition": 408,"children": 89,"contentToOption": 590,"maxOpacity": 215,"squareRatio": 281,"leafDepth": 347,"zoomToNodeRatio": 300,"childrenVisibleMin": 303,"shape": 1054,"length2": 891,"endValue": 1107,"gravity": 634,"edgeLength": 662,"layoutAnimation": 485,"colorAlpha": 389,"constantSpeed": 451,"trailLength": 530,"dim": 313,"areaSelectStyle": 253,"funnelAlign": 334,"buttonTextColor": 177,"buttonColor": 205,"levels": 2267,"textColor": 178,"lineX": 46,"lineY": 32,"showPlayBtn": 64,"showPrevBtn": 43,"showNextBtn": 43,"playIcon": 90,"stopIcon": 48,"prevIcon": 39,"nextIcon": 36,"ellipsis": 76,"clear": 114,"colorMappingBy": 424,"maxSize": 131,"minSize": 147,"gap": 175,"visibleMin": 315,"axisExpandable": 134,"layoutIterations": 226,"nodeGap": 158,"nodeWidth": 134,"axisExpandCenter": 79,"axisExpandCount": 56,"axisExpandWidth": 51,"boxWidth": 46,"gapWidth": 78,"borderColorSaturation": 56,"inactiveOpacity": 51,"keep": 41,"colorSaturation": 343,"visualDimension": 471,"id": 138,"borderColor0": 67,"emptyItemWidth": 60,"activeOpacity": 43,"radiusAxisIndex": 574,"angleAxisIndex": 478,"textPosition": 232,"minOpen": 194,"maxOpen": 125,"graphic": 5617,"elements": 3108,"image": 673,"group": 488,"$action": 82,"style": 431,"textVeticalAlign": 13,"fill": 55,"stroke": 47,"lineWidth": 34,"sector": 93,"bezier-curve": 6,"cpx2": 1,"cpy2": 1,"circle": 256,"arc": 61,"bezierCurve": 61,"onclick": 101,"onmouseover": 32,"font": 17,"bounding": 75,"cursor": 54,"themeRiver": 11,"confine": 580,"ring": 103,"ondragleave": 3,"ondragstart": 4,"ondragover": 4,"disabled": 221,"visualMin": 44,"visualMax": 18,"onmousemove": 14,"ondrag": 8,"ondragend": 2,"x2": 7,"x1": 4,"y1": 2,"y2": 3,"percent": 6,"ondrop": 9,"cx": 7,"smoothConstraint": 20,"cpx1": 2,"points": 16,"onmousewheel": 13,"onmouseout": 7,"barBorderWidth": 2,"ondragenter": 2,"onmouseup": 1,"cy": 1,"r": 2,"onmousedown": 1,"animationThreshold": 1};
var fullKeywordsList = ["0","1","title","show","text","link","target","textStyle","color","fontStyle","fontWeight","fontFamily","fontSize","textAlign","textBaseline","subtext","sublink","subtarget","subtextStyle","padding","itemGap","zlevel","z","left","top","right","bottom","backgroundColor","borderColor","borderWidth","shadowBlur","shadowColor","shadowOffsetX","shadowOffsetY","legend","width","height","orient","align","itemWidth","itemHeight","formatter","selectedMode","inactiveColor","selected","tooltip","data","name","icon","grid","containLabel","trigger","axisPointer","type","axis","snap","label","precision","margin","lineStyle","opacity","shadowStyle","crossStyle","position","extraCssText","xAxis","gridIndex","offset","nameLocation","nameTextStyle","nameGap","nameRotate","inverse","boundaryGap","min","max","scale","splitNumber","minInterval","interval","logBase","silent","triggerEvent","axisLine","onZero","axisTick","alignWithLabel","inside","length","axisLabel","rotate","showMinLabel","showMaxLabel","baseline","splitLine","splitArea","areaStyle","value","tiggerTooltip","status","handle","size","throttle","yAxis","polar","center","radius","radiusAxis","polarIndex","angleAxis","startAngle","clockwise","radar","shape","indicator","dataZoom","disabled","xAxisIndex","yAxisIndex","radiusAxisIndex","angleAxisIndex","filterMode","start","end","startValue","endValue","minSpan","maxSpan","minValueSpan","maxValueSpan","zoomLock","dataBackground","fillerColor","handleIcon","handleSize","handleStyle","borderType","labelPrecision","labelFormatter","showDetail","showDataShadow","realtime","visualMap","range","calculable","textGap","dimension","seriesIndex","hoverLink","inRange","outOfRange","controller","pieces","categories","minOpen","maxOpen","showLabel","itemSymbol","showContent","alwaysShowContent","triggerOn","showDelay","hideDelay","enterable","confine","transitionDuration","toolbox","itemSize","showTitle","feature","saveAsImage","excludeComponents","iconStyle","normal","textPosition","emphasis","pixelRatio","restore","dataView","readOnly","optionToContent","contentToOption","lang","textareaColor","textareaBorderColor","textColor","buttonColor","buttonTextColor","zoom","back","magicType","line","bar","stack","tiled","option","brush","rect","polygon","lineX","lineY","keep","clear","brushLink","geoIndex","brushType","brushMode","transformable","brushStyle","throttleType","throttleDelay","removeOnClick","inBrush","outOfBrush","geo","map","roam","aspectScale","boundingCoords","scaleLimit","nameMap","itemStyle","layoutCenter","layoutSize","regions","areaColor","parallel","layout","axisExpandable","axisExpandCenter","axisExpandCount","axisExpandWidth","axisExpandTriggerOn","parallelAxisDefault","parallelAxis","dim","parallelIndex","areaSelectStyle","singleAxis","timeline","axisType","currentIndex","autoPlay","rewind","loop","playInterval","controlPosition","symbol","symbolSize","symbolRotate","symbolOffset","checkpointStyle","animation","animationDuration","animationEasing","controlStyle","showPlayBtn","showPrevBtn","showNextBtn","playIcon","stopIcon","prevIcon","nextIcon","graphic","elements","id","$action","bounding","invisible","cursor","draggable","progressive","children","onclick","onmouseover","onmouseout","onmousemove","onmousewheel","onmousedown","onmouseup","ondrag","ondragstart","ondragend","ondragenter","ondragleave","ondragover","ondrop","style","image","x","y","fill","stroke","lineWidth","font","textVeticalAlign","cx","cy","r","r0","endAngle","points","smooth","smoothConstraint","x1","y1","x2","y2","percent","cpx1","cpy1","cpx2","cpy2","calendar","cellSize","dayLabel","firstDay","monthLabel","yearLabel","series","coordinateSystem","showSymbol","showAllSymbol","hoverAnimation","legendHoverLink","connectNulls","clipOverflow","step","smoothMonotone","sampling","markPoint","valueIndex","valueDim","coord","animationThreshold","animationDelay","animationDurationUpdate","animationEasingUpdate","animationDelayUpdate","markLine","curveness","markArea","barBorderRadius","barWidth","barMaxWidth","barMinHeight","barGap","barCategoryGap","selectedOffset","minAngle","roseType","avoidLabelOverlap","stillShowZeroSum","labelLine","length2","animationType","large","largeThreshold","effectType","showEffectOn","rippleEffect","period","radarIndex","squareRatio","leafDepth","nodeClick","zoomToNodeRatio","levels","visualDimension","visualMin","visualMax","colorAlpha","colorSaturation","colorMappingBy","visibleMin","childrenVisibleMin","ellipsis","gapWidth","borderColorSaturation","breadcrumb","emptyItemWidth","boxWidth","barMinWidth","color0","borderColor0","blurSize","minOpacity","maxOpacity","mapValueCalculation","showLegendSymbol","inactiveOpacity","activeOpacity","polyline","effect","delay","constantSpeed","trailLength","coords","circular","rotateLabel","force","initLayout","repulsion","gravity","edgeLength","layoutAnimation","nodeScaleRatio","focusNodeAdjacency","edgeSymbol","edgeSymbolSize","edgeLabel","category","nodes","links","source","edges","nodeWidth","nodeGap","layoutIterations","minSize","maxSize","sort","gap","funnelAlign","distance","pointer","offsetCenter","detail","symbolPosition","symbolRepeat","symbolRepeatDirection","symbolMargin","symbolClip","symbolBoundingData","symbolPatternSize","singleAxisIndex","date","progressiveThreshold","blendMode","hoverLayerThreshold","useUTC"];

for (var i = 0; i < fullKeywordsList.length; i++) {
    if (keywords[fullKeywordsList[i]] == null) {
        keywords[fullKeywordsList[i]] = 0;
    }
}
var completions = [];
for (var key in keywords) {
    completions.push({
        caption: key,
        value: key,
        score: keywords[key],
        metal: 'local'
    });
}
lnTools.addCompleter({
    getCompletions: function (editor, session, pos, prefix, callback) {
        callback(null, completions);
    }
});

_.each((location.search || '').substr(1).split('&'), function (item) {
    var kv = item.split('=');
    configs[kv[0]] = kv[1];
});

function makeSearch(obj) {
    var search = [];
    for (var key in obj) {
        if (obj[key] != null) {
            search.push(key + '=' + obj[key]);
        }
    }
    return search.join('&');
}

var gb = {
    handler: {
        isDown: false
    },
    lastTyping: 0,
    editor: null,
    chart: null,
    loadedCode: null,
    echartsSource: {},

    lastOption: null,
    updateTime: 0,
    debounceTime: 500,

    enableLive: !configs.gl && !configs.nolive
};

var COLORS = {
    default: ['#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'],
    light: ['#37A2DA', '#32C5E9', '#67E0E3', '#9FE6B8', '#FFDB5C','#ff9f7f', '#fb7293', '#E062AE', '#E690D1', '#e7bcf3', '#9d96f5', '#8378EA', '#96BFFF'],
    dark: ['#dd6b66','#759aa0','#e69d87','#8dc1a9','#ea7e53','#eedd78','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42']
};

$('#theme .' + (configs.theme || 'default')).addClass('selected');

$('#theme a').click(function () {
    if ($(this).hasClass('selected')) {
        return;
    }
    var theme = $(this).attr('class').replace('default', '').trim();

    window.location.href = './editor.html?' + makeSearch({
        c: configs.c,
        gl: configs.gl || null,
        theme: theme || null
    });
})
// Add popover
$('#theme a').popover({
    html: true,
    content: function () {
        var theme = $(this).attr('class').replace('selected', '').trim();
        return '<div class="theme-palette ' + theme + '">'
            + COLORS[theme].map(function (color) {
                return '<span style="background-color:' + color + '"></span>'
            }).join('')
            + '</div>';
    },
    placement: 'top',
    trigger: 'hover'
});


$(document).ready(function() {

    initEditor();
    checkEditorIfToShow();

    initEcharts();

    initControl();

    initEventHandler();

    load();
    
    
});



function initEditor() {

    gb.editor = ace.edit('code-panel');
    gb.editor.getSession().setMode('ace/mode/javascript');

    gb.editor.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: true
    });
}



function initEcharts() {

    // gb.chart

    gb.editor.setValue('// Schema:\n// date,AQIindex,PM2.5,PM10,CO,NO2,SO2\nvar dataBJ = [\n    [1,55,9,56,0.46,18,6,"良"],\n    [2,25,11,21,0.65,34,9,"优"],\n    [3,56,7,63,0.3,14,5,"良"],\n    [4,33,7,29,0.33,16,6,"优"],\n    [5,42,24,44,0.76,40,16,"优"],\n    [6,82,58,90,1.77,68,33,"良"],\n    [7,74,49,77,1.46,48,27,"良"],\n    [8,78,55,80,1.29,59,29,"良"],\n    [9,267,216,280,4.8,108,64,"重度污染"],\n    [10,185,127,216,2.52,61,27,"中度污染"],\n    [11,39,19,38,0.57,31,15,"优"],\n    [12,41,11,40,0.43,21,7,"优"],\n    [13,64,38,74,1.04,46,22,"良"],\n    [14,108,79,120,1.7,75,41,"轻度污染"],\n    [15,108,63,116,1.48,44,26,"轻度污染"],\n    [16,33,6,29,0.34,13,5,"优"],\n    [17,94,66,110,1.54,62,31,"良"],\n    [18,186,142,192,3.88,93,79,"中度污染"],\n    [19,57,31,54,0.96,32,14,"良"],\n    [20,22,8,17,0.48,23,10,"优"],\n    [21,39,15,36,0.61,29,13,"优"],\n    [22,94,69,114,2.08,73,39,"良"],\n    [23,99,73,110,2.43,76,48,"良"],\n    [24,31,12,30,0.5,32,16,"优"],\n    [25,42,27,43,1,53,22,"优"],\n    [26,154,117,157,3.05,92,58,"中度污染"],\n    [27,234,185,230,4.09,123,69,"重度污染"],\n    [28,160,120,186,2.77,91,50,"中度污染"],\n    [29,134,96,165,2.76,83,41,"轻度污染"],\n    [30,52,24,60,1.03,50,21,"良"],\n    [31,46,5,49,0.28,10,6,"优"]\n];\n\nvar dataGZ = [\n    [1,26,37,27,1.163,27,13,"优"],\n    [2,85,62,71,1.195,60,8,"良"],\n    [3,78,38,74,1.363,37,7,"良"],\n    [4,21,21,36,0.634,40,9,"优"],\n    [5,41,42,46,0.915,81,13,"优"],\n    [6,56,52,69,1.067,92,16,"良"],\n    [7,64,30,28,0.924,51,2,"良"],\n    [8,55,48,74,1.236,75,26,"良"],\n    [9,76,85,113,1.237,114,27,"良"],\n    [10,91,81,104,1.041,56,40,"良"],\n    [11,84,39,60,0.964,25,11,"良"],\n    [12,64,51,101,0.862,58,23,"良"],\n    [13,70,69,120,1.198,65,36,"良"],\n    [14,77,105,178,2.549,64,16,"良"],\n    [15,109,68,87,0.996,74,29,"轻度污染"],\n    [16,73,68,97,0.905,51,34,"良"],\n    [17,54,27,47,0.592,53,12,"良"],\n    [18,51,61,97,0.811,65,19,"良"],\n    [19,91,71,121,1.374,43,18,"良"],\n    [20,73,102,182,2.787,44,19,"良"],\n    [21,73,50,76,0.717,31,20,"良"],\n    [22,84,94,140,2.238,68,18,"良"],\n    [23,93,77,104,1.165,53,7,"良"],\n    [24,99,130,227,3.97,55,15,"良"],\n    [25,146,84,139,1.094,40,17,"轻度污染"],\n    [26,113,108,137,1.481,48,15,"轻度污染"],\n    [27,81,48,62,1.619,26,3,"良"],\n    [28,56,48,68,1.336,37,9,"良"],\n    [29,82,92,174,3.29,0,13,"良"],\n    [30,106,116,188,3.628,101,16,"轻度污染"],\n    [31,118,50,0,1.383,76,11,"轻度污染"]\n];\n\nvar dataSH = [\n    [1,91,45,125,0.82,34,23,"良"],\n    [2,65,27,78,0.86,45,29,"良"],\n    [3,83,60,84,1.09,73,27,"良"],\n    [4,109,81,121,1.28,68,51,"轻度污染"],\n    [5,106,77,114,1.07,55,51,"轻度污染"],\n    [6,109,81,121,1.28,68,51,"轻度污染"],\n    [7,106,77,114,1.07,55,51,"轻度污染"],\n    [8,89,65,78,0.86,51,26,"良"],\n    [9,53,33,47,0.64,50,17,"良"],\n    [10,80,55,80,1.01,75,24,"良"],\n    [11,117,81,124,1.03,45,24,"轻度污染"],\n    [12,99,71,142,1.1,62,42,"良"],\n    [13,95,69,130,1.28,74,50,"良"],\n    [14,116,87,131,1.47,84,40,"轻度污染"],\n    [15,108,80,121,1.3,85,37,"轻度污染"],\n    [16,134,83,167,1.16,57,43,"轻度污染"],\n    [17,79,43,107,1.05,59,37,"良"],\n    [18,71,46,89,0.86,64,25,"良"],\n    [19,97,71,113,1.17,88,31,"良"],\n    [20,84,57,91,0.85,55,31,"良"],\n    [21,87,63,101,0.9,56,41,"良"],\n    [22,104,77,119,1.09,73,48,"轻度污染"],\n    [23,87,62,100,1,72,28,"良"],\n    [24,168,128,172,1.49,97,56,"中度污染"],\n    [25,65,45,51,0.74,39,17,"良"],\n    [26,39,24,38,0.61,47,17,"优"],\n    [27,39,24,39,0.59,50,19,"优"],\n    [28,93,68,96,1.05,79,29,"良"],\n    [29,188,143,197,1.66,99,51,"中度污染"],\n    [30,174,131,174,1.55,108,50,"中度污染"],\n    [31,187,143,201,1.39,89,53,"中度污染"]\n];\n\nvar schema = [\n    {name: \'date\', index: 0, text: \'日期\'},\n    {name: \'AQIindex\', index: 1, text: \'AQI\'},\n    {name: \'PM25\', index: 2, text: \'PM2.5\'},\n    {name: \'PM10\', index: 3, text: \'PM10\'},\n    {name: \'CO\', index: 4, text: \' CO\'},\n    {name: \'NO2\', index: 5, text: \'NO2\'},\n    {name: \'SO2\', index: 6, text: \'SO2\'},\n    {name: \'等级\', index: 7, text: \'等级\'}\n];\n\nvar lineStyle = {\n    normal: {\n        width: 1,\n        opacity: 0.5\n    }\n};\n\noption = {\n    backgroundColor: \'#333\',\n    legend: {\n        bottom: 30,\n        data: [\'北京\', \'上海\', \'广州\'],\n        itemGap: 20,\n        textStyle: {\n            color: \'#fff\',\n            fontSize: 14\n        }\n    },\n    tooltip: {\n        padding: 10,\n        backgroundColor: \'#222\',\n        borderColor: \'#777\',\n        borderWidth: 1,\n        formatter: function (obj) {\n            var value = obj[0].value;            return \'<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">\'\n                + obj[0].seriesName + \' \' + value[0] + \'日期：\'\n                + value[7]\n                + \'</div>\'\n                + schema[1].text + \'：\' + value[1] + \'<br>\'\n                + schema[2].text + \'：\' + value[2] + \'<br>\'\n                + schema[3].text + \'：\' + value[3] + \'<br>\'\n                + schema[4].text + \'：\' + value[4] + \'<br>\'\n                + schema[5].text + \'：\' + value[5] + \'<br>\'\n                + schema[6].text + \'：\' + value[6] + \'<br>\';\n        }\n    },\n    // dataZoom: {\n    //     show: true,\n    //     orient: \'vertical\',\n    //     parallelAxisIndex: [0]\n    // },\n    parallelAxis: [\n        {dim: 0, name: schema[0].text, inverse: true, max: 31, nameLocation: \'start\'},\n        {dim: 1, name: schema[1].text},\n        {dim: 2, name: schema[2].text},\n        {dim: 3, name: schema[3].text},\n        {dim: 4, name: schema[4].text},\n        {dim: 5, name: schema[5].text},\n        {dim: 6, name: schema[6].text},\n        {dim: 7, name: schema[7].text,        type: \'category\', data: [\'优\', \'良\', \'轻度污染\', \'中度污染\', \'重度污染\', \'严重污染\']}\n    ],\n    visualMap: {\n        show: true,\n        min: 0,\n        max: 150,\n        dimension: 2,\n        inRange: {\n            color: [\'#d94e5d\',\'#eac736\',\'#50a3ba\'].reverse(),\n            // colorAlpha: [0, 1]\n        }\n    },\n    parallel: {\n        left: \'5%\',\n        right: \'18%\',\n        bottom: 100,\n        parallelAxisDefault: {\n            type: \'value\',\n            name: \'AQI指数\',\n            nameLocation: \'end\',\n            nameGap: 20,\n            nameTextStyle: {\n                color: \'#fff\',\n                fontSize: 12\n            },\n            axisLine: {\n                lineStyle: {\n                    color: \'#aaa\'\n                }\n            },\n            axisTick: {\n                lineStyle: {\n                    color: \'#777\'\n                }\n            },\n            splitLine: {\n                show: false\n            },\n            axisLabel: {\n                textStyle: {\n                    color: \'#fff\'\n                }\n            }\n        }\n    },\n    series: [\n        {\n            name: \'北京\',\n            type: \'parallel\',\n            lineStyle: lineStyle,\n            data: dataBJ\n        },\n        {\n            name: \'上海\',\n            type: \'parallel\',\n            lineStyle: lineStyle,\n            data: dataSH\n        },\n        {\n            name: \'广州\',\n            type: \'parallel\',\n            lineStyle: lineStyle,\n            data: dataGZ\n        }\n    ]\n};\n');
    gb.editor.selection.setSelectionRange({
        start: {
            row:1,
            column: 4
        }, end: {
            row:1,
            column: 4
        }
    });

	disposeAndRun();
}



function initControl() {

    // init dropdown button groups
    $('#theme-dropdown').on('click', 'li a', function(){
        setThemeButton($(this).text());
    });
    $('#echarts-version-dropdown').on('click', 'li a', function() {
        setEchartsVersionButton($(this).text());
    });

}



function setThemeButton(text) {

    $('#theme-btn').html('ECharts-' + text + ' <span class="caret"></span>');
    $('#theme-btn').val(text);
    disposeAndRun();

}



function setEchartsVersionButton(version) {

    $('#echarts-version-btn').html('ECharts-' + version
        + ' <span class="caret"></span>');
    $('#echarts-version-btn').val(version);
    updateEchartsVersion();

}



function initEventHandler() {

    // reset typing state
    var typingHandler = null;


    if (gb.enableLive) {  // Not using live when it's GL
        gb.editor.on('change', function() {
            runDebounce();
        });
    }

    $('#h-handler').mousedown(function() {

        gb.handler.isDown = true;

    });


    $(window).mousemove(function(e) {

        if (gb.handler.isDown) {
            var left = e.clientX / window.innerWidth;
            setSplitPosition(left);
        }

    }).mouseup(function() {

        gb.handler.isDown = false;

    });

    $(window).resize(function() {
        gb.chart.resize();
        appEnv.onresize && appEnv.onresize();
        checkEditorIfToShow();
    });

}



// set splitter position by percentage, left should be between 0 to 1
function setSplitPosition(percentage) {
    percentage = Math.min(0.9, Math.max(0.1, percentage));

    var left = percentage * 100;
    $('#code-container').css('width', left + '%');
    $('.right-container').css('width', (100 - left) + '%')
        .css('left', left + '%');
    $('#h-handler').css('left', left + '%');

    if (gb.chart) {
        gb.chart.resize();
        appEnv.onresize && appEnv.onresize();
    }
}


function checkEditorIfToShow() {

    // hide editor for mobile devices
    if (window.innerWidth < 768) {
        if (gb.editorIsShown === undefined || gb.editorIsShown === true) {
            // hide editor
            $('#code-container').hide();
            $('#h-handler').hide();
            $('.right-container').css('width', '100%').css('left', '0%');
            gb.editorIsShown = false;
        }
    } else {
        if (gb.editorIsShown === undefined || gb.editorIsShown === false) {
            // show editor
            $('#code-container').show();
            $('#h-handler').show();
            setSplitPosition(0.4);
            gb.editorIsShown = true;
        }
    }
}


var appEnv = {};
var gui;

var _intervalIdList = [];
var _timeoutIdList = [];

var _oldSetTimeout = window.setTimeout;
var _oldSetInterval = window.setInterval;

window.setTimeout = function (func, delay) {
    var id = _oldSetTimeout(func, delay);
    _timeoutIdList.push(id);
    return id;
};
window.setInterval = function (func, gap) {
    var id = _oldSetInterval(func, gap);
    _intervalIdList.push(id);
    return id;
};
function _clearTimeTickers() {
    for (var i = 0; i < _intervalIdList.length; i++) {
        clearInterval(_intervalIdList[i]);
    }
    for (var i = 0; i < _timeoutIdList.length; i++) {
        clearTimeout(_timeoutIdList[i]);
    }
    _intervalIdList = [];
    _timeoutIdList = [];
}
var _events = [];
function _wrapOnMethods(chart) {
    var oldOn = chart.on;
    chart.on = function (eventName) {
        var res = oldOn.apply(chart, arguments);
        _events.push(eventName);
        return res;
    };
}

function _clearChartEvents() {
    _events.forEach(function (eventName) {
        if (gb.chart) {
            gb.chart.off(eventName);
        }
    });

    _events.length = 0;
}

// run to get echarts locally
var run = function (ignoreOptionNotChange) {
    if (!gb.chart) {
        gb.chart = echarts.init($('#chart-panel')[0], configs.theme, {
            renderer: configs.renderer || 'canvas'
        });
        _wrapOnMethods(gb.chart);
    }
    // check if code is valid
    if (hasEditorError()) {
        log(lang.errorInEditor, 'error');
        return;
    }

    // save locallly
    localSave();

    _clearTimeTickers();
    _clearChartEvents();
    // Reset
    appEnv.config = null;

    // run the code
    try {

        var myChart = gb.chart;
        // FIXME
        var app = appEnv;

        // Reset option
        option = null;
        eval(gb.editor.getValue());

        if (option && typeof option === 'object' && (!_.isEqual(option, gb.lastOption) || ignoreOptionNotChange)) {
            gb.lastOption = option;
            var startTime = +new Date();
            gb.chart.setOption(option, true);
            var endTime = +new Date();
            gb.updateTime = endTime - startTime;

            // Find the appropriate throttle time
            var debounceTime = 500;
            var debounceTimeQuantities = [500, 2000, 5000, 10000];
            for (var i = debounceTimeQuantities.length - 1; i >= 0; i--) {
                var quantity = debounceTimeQuantities[i];
                var preferredDebounceTime = debounceTimeQuantities[i + 1] || 1000000;
                if (gb.updateTime > quantity && gb.debounceTime !== preferredDebounceTime) {
                    gb.debounceTime = preferredDebounceTime;
                    runDebounce = _.debounce(run, preferredDebounceTime, {
                        trailing: true
                    });
                    break;
                }
            }
            log(lang.chartOK + gb.updateTime + 'ms');
        }

        if (gui) {
            $(gui.domElement).remove();
            gui.destroy();
            gui = null;
        }

        if (app.config) {
            gui = new dat.GUI({
                autoPlace: false
            });
            $(gui.domElement).css({
                position: 'absolute',
                right: 5,
                top: 0,
                zIndex: 1000
            });
            $('.right-container').append(gui.domElement);

            var configParameters = app.configParameters || {};
            for (var name in app.config) {
                var value = app.config[name];
                if (name !== 'onChange' && name !== 'onFinishChange') {
                    var isColor = false;
                    // var value = obj;
                    var controller;
                    if (configParameters[name]) {
                        if (configParameters[name].options) {
                            controller = gui.add(app.config, name, configParameters[name].options);
                        }
                        else if (configParameters[name].min != null) {
                            controller = gui.add(app.config, name, configParameters[name].min, configParameters[name].max);
                        }
                    }
                    if (typeof obj === 'string') {
                        try {
                            var colorArr = echarts.color.parse(value);
                            isColor = !!colorArr;
                            if (isColor) {
                                value = echarts.color.stringify(colorArr, 'rgba');
                            }
                        }
                        catch (e) {}
                    }
                    if (!controller) {
                        controller = gui[isColor ? 'addColor' : 'add'](app.config, name);
                    }
                    app.config.onChange && controller.onChange(app.config.onChange);
                    app.config.onFinishChange && controller.onFinishChange(app.config.onFinishChange);
                }
            }
        }
    } catch(e) {
        log(lang.errorInEditor, 'error');
        console.error(e);
    }
};

var runDebounce = _.debounce(run, gb.debounceTime, {
    trailing: true
});

function disposeAndRun() {

    // dispose
    if (gb.chart) {
        gb.chart.dispose();
    }

    // init with theme
    var theme = $('#theme-btn').val() || 'default';
    gb.chart = null;

    // run with option in code panel
    run(true);
}



// update echarts version locally
function updateEchartsVersion() {

    var version = $('#echarts-version-btn').val();

    // update only when version is different
    if (echarts && version === echarts.version && !gb.echartsSource[version]) {
        return;
    }

    // echarts = null;

    try {
        eval(gb.echartsSource[version]);
        disposeAndRun();
    } catch (e) {
        log('加载 ECharts 版本失败！', 'error');
    }

}






// save chart to localStorage
function localSave() {

    var code = gb.editor.getValue();

    if (window.localStorage && code !== gb.loadedCode) {
        try {
            window.localStorage.setItem('code', code);
            $('#reset-btn').css('display', 'inline-block');
        } catch (e) {
            console.error(e);
            log('缓存到本地失败，刷新页面后图表将不被保存，请及时保存');
        }
    }

}



// load code from localStorage
function localLoad() {

    try {
        var code = window.localStorage.getItem('code');
        if (code) {
            gb.editor.setValue(code, -1);

            if (!gb.enableLive) {
                runDebounce();
            }

            log('读取本地缓存成功');
        }
    } catch (e) {
        console.error(e);
    }

}



// reset editor with loaded code
function localReset() {

    if (gb.loadedCode) {
        gb.editor.setValue(gb.loadedCode);

        if (!gb.enableLive) {
            runDebounce();
        }

        localSave();
        $('#reset-btn').hide();
        run();
    }

}



function hasEditorError() {

    var annotations = gb.editor.getSession().getAnnotations();
    for (var aid = 0, alen = annotations.length; aid < alen; ++aid) {
        if (annotations[aid].type === 'error') {
            return true;
        }
    }
    return false;

}



// load a chart with chart id in url
function load() {
    var dataRoot = configs.gl ? 'data-gl' : 'data';

    if (configs.gl) {
        var script = document.createElement('script');
        script.onload = function () {
            loadChart();
        };
        script.src = './vendors/echarts-gl/echarts-gl.js';
        document.body.appendChild(script);
    }
    else {
        loadChart();
    }

    function loadChart() {
        if (configs.c) {
            $.ajax('./' + dataRoot + '/' + configs.c + '.js', {
                dataType: 'text',
                success: function (data) {
                    gb.loadedCode = data;
                    gb.editor.setValue(data, -1);
                    if (!gb.enableLive) {
                        runDebounce();
                    }
                }
            }).fail(function () {
                log('加载图表失败！', 'error');
            });
        }
    }
    return;
}



// show log info in code-info panel
// type should be 'info', 'warn', 'error'
function log(text, type) {

    // log time
    var timeStr = formatTime(new Date());

    if (type !== 'warn' && type !== 'error') {
        type = 'info';
    }

    $('#code-info').html(
        '<span class="code-info-time">' + timeStr + '</span>' +
        '<span class="code-info-type-' + type + '">' + text + '</span>'
    );

}



// format time to string
function formatTime(time) {

    var digits = [time.getHours(), time.getMinutes(), time.getSeconds()];
    var timeStr = '';
    for (var i = 0, len = digits.length; i < len; ++i) {
        timeStr += (digits[i] < 10 ? '0' : '') + digits[i];
        if (i < len - 1) {
            timeStr += ':';
        }
    }
    return timeStr;

}



// get version id of current page
function getVersion() {

    var url = window.location.href.split('/');
    if (url.length === 4) {
        // no version in url, first version
        return 1;
    } else {
        return parseInt(url[url.length - 1], 10) || 1;
    }

}



// get version id of current page
function getCid() {

    return window.location.href.split('/')[3];

}



// download example html and js

function downloadExample() {

    var html =
'<!DOCTYPE html>\n' +
'<html style="height: 100%">\n' +
'   <head>\n' +
'       <meta charset="utf-8">\n' +
'   </head>\n' +
'   <body style="height: 100%; margin: 0">\n' +
'       <div id="container" style="height: 100%"></div>\n' +

'       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>\n' +
'       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>\n' +
'       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>\n' +
'       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>\n' +
'       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>\n' +
'       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>\n' +
'       <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>\n' +
'       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>\n' +
'       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>\n' +

'       <script type="text/javascript">\n' +
'var dom = document.getElementById("container");\n' +
'var myChart = echarts.init(dom);\n' +
'var app = {};\n' +

'option = null;\n' +
gb.editor.getValue() + ';\n' +

'if (option && typeof option === "object") {\n' +
'    myChart.setOption(option, true);\n' +
'}\n' +
'       </script>\n' +
'   </body>\n' +
'</html>';
    var file = new Blob([html], {
        type: 'text/html;charset=UTF-8',
        encoding: 'UTF-8'
    });
    var a = document.createElement('a');
    a.href = URL.createObjectURL(file);
    a.download = configs.c + '.html';
    a.click();

}

$('#download').click(downloadExample);