/* tablesandstats.do *//* This do file produces Table 2 from the paper as well as statistics noted throughout the text */log on/*** Table 2 ****//* Estimate Everything Together */nl (cons1= (((1 - (({delta=1}^k)*(theta))^(1/({alpha = 0.7} - 1)))*{gamma=1}) + ((({delta=1}^k)*(theta))^(1/({alpha = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta=1}^k)^(1/({alpha=0.7} -1)))) if risk100100 == 1 | risk5050==1, clu(labnumber)nlcom (alpha: _b[/alpha]) (yearrate: 1/_b[/delta]^365-1) (omega: _b[/gamma]), postest store col1/* Estimate Everything Sepearately */nl (cons1= (((1 - (({delta100100=1}^k)*(theta))^(1/({alpha100100 = 0.7} - 1)))*{gamma100100=1}) + ((({delta100100=1}^k)*(theta))^(1/({alpha100100 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta100100=1}^k)^(1/({alpha100100=0.7} -1)))*risk100100 + (((1 - (({delta5050=1}^k)*(theta))^(1/({alpha5050 = 0.7} - 1)))*{gamma5050=1}) + ((({delta5050=1}^k)*(theta))^(1/({alpha5050 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta5050=1}^k)^(1/({alpha5050=0.7} -1)))*(risk5050) ) if risk100100 == 1 | risk5050==1 , clu(labnumber)nlcom (alpha100100: _b[/alpha100100]) (alpha5050: _b[/alpha5050]) (yearrate100100: 1/_b[/delta100100]^365-1)  (yearrate5050: 1/_b[/delta5050]^365-1)  (omega100100: _b[/gamma100100]) (omega5050: _b[/gamma5050]), posttest _b[alpha100100] = _b[alpha5050]test _b[yearrate100100] = _b[yearrate5050]test _b[omega100100] = _b[omega5050]test _b[alpha100100] = _b[alpha5050], accumtest _b[yearrate100100] = _b[yearrate5050], accumtest _b[omega100100] = _b[omega5050], accumest store col2/* Restrict Curvature Terms to be Equal */nl (cons1= (((1 - (({delta100100=1}^k)*(theta))^(1/({alpha = 0.7} - 1)))*{gamma100100=1}) + ((({delta100100=1}^k)*(theta))^(1/({alpha = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta100100=1}^k)^(1/({alpha=0.7} -1)))*risk100100 + (((1 - (({delta5050=1}^k)*(theta))^(1/({alpha = 0.7} - 1)))*{gamma5050=1}) + ((({delta5050=1}^k)*(theta))^(1/({alpha = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta5050=1}^k)^(1/({alpha=0.7} -1)))*risk5050 ) if risk100100 == 1 | risk5050==1, clu(labnumber)nlcom (alpha: _b[/alpha]) (yearrate100100: 1/_b[/delta100100]^365-1)  (yearrate5050: 1/_b[/delta5050]^365-1)  (omega100100: _b[/gamma100100]) (omega5050: _b[/gamma5050]), posttest _b[yearrate100100] = _b[yearrate5050], accumtest _b[omega100100] = _b[omega5050], accumest store col3/* Restrict Discounting to be Equal */nl (cons1= (((1 - (({delta=1}^k)*(theta))^(1/({alpha100100 = 0.7} - 1)))*{gamma100100=1}) + ((({delta=1}^k)*(theta))^(1/({alpha100100 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta=1}^k)^(1/({alpha100100=0.7} -1)))*risk100100 + (((1 - (({delta=1}^k)*(theta))^(1/({alpha5050 = 0.7} - 1)))*{gamma5050=1}) + ((({delta=1}^k)*(theta))^(1/({alpha5050 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta=1}^k)^(1/({alpha5050=0.7} -1)))*risk5050 ) if risk100100 == 1 | risk5050==1, clu(labnumber)nlcom (alpha100100: _b[/alpha100100]) (alpha5050: _b[/alpha5050]) (yearrate: 1/_b[/delta]^365-1)   (omega100100: _b[/gamma100100]) (omega5050: _b[/gamma5050]), posttest _b[alpha100100] = _b[alpha5050]test _b[omega100100] = _b[omega5050], accumest store col4/* Restrict Background Terms to be Equal */nl (cons1= (((1 - (({delta100100=1}^k)*(theta))^(1/({alpha100100 = 0.7} - 1)))*{gamma=1}) + ((({delta100100=1}^k)*(theta))^(1/({alpha100100 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta100100=1}^k)^(1/({alpha100100=0.7} -1)))*risk100100 + (((1 - (({delta5050=1}^k)*(theta))^(1/({alpha5050 = 0.7} - 1)))*{gamma=1}) + ((({delta5050=1}^k)*(theta))^(1/({alpha5050 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta5050=1}^k)^(1/({alpha5050=0.7} -1)))*risk5050 ) if risk100100 == 1 | risk5050==1, clu(labnumber)nlcom (alpha100100: _b[/alpha100100]) (alpha5050: _b[/alpha5050]) (yearrate100100: 1/_b[/delta100100]^365-1)  (yearrate5050: 1/_b[/delta5050]^365-1)  (omega: _b[/gamma]), posttest _b[alpha100100] = _b[alpha5050]est store col5/* Restrict Background and Discounting Terms to be Equal */nl (cons1= (((1 - (({delta=1}^k)*(theta))^(1/({alpha100100 = 0.7} - 1)))*{gamma=1}) + ((({delta=1}^k)*(theta))^(1/({alpha100100 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta=1}^k)^(1/({alpha100100=0.7} -1)))*risk100100 + (((1 - (({delta=1}^k)*(theta))^(1/({alpha5050 = 0.7} - 1)))*{gamma=1}) + ((({delta=1}^k)*(theta))^(1/({alpha5050 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta=1}^k)^(1/({alpha5050=0.7} -1)))*risk5050 ) if risk100100 == 1 | risk5050==1, clu(labnumber)nlcom (alpha100100: _b[/alpha100100]) (alpha5050: _b[/alpha5050]) (yearrate: 1/_b[/delta]^365-1)   (omega: _b[/gamma]), posttest _b[alpha100100] = _b[alpha5050]est store col6/* Restrict Background and Discounting Terms to be Equal and include 50-40 and 40-50 data */nl (cons1= (((1 - (({delta=1}^k)*(theta))^(1/({alpha100100 = 0.7} - 1)))*{gamma=1}) + ((({delta=1}^k)*(theta))^(1/({alpha100100 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta=1}^k)^(1/({alpha100100=0.7} -1)))*risk100100 + (((1 - (({delta=1}^k)*(theta))^(1/({alpha5050 = 0.7} - 1)))*{gamma=1}) + ((({delta=1}^k)*(theta))^(1/({alpha5050 = 0.7} -1 )))*mnumer )      /(1 + irate*(theta*{delta=1}^k)^(1/({alpha5050=0.7} -1)))*(risk5050+ risk5040 + risk4050) ) if risk100100 == 1 | risk5050==1 | risk4050 ==1 | risk5040==1, clu(labnumber)nlcom (alpha100100: _b[/alpha100100]) (alpha5050: _b[/alpha5050]) (yearrate: 1/_b[/delta]^365-1)   (omega: _b[/gamma]), posttest _b[alpha100100] = _b[alpha5050]est store col7/* Table 2 (TEX) */estout col1 col2 col3 col4 col5 col6, cells(b(fmt(%9.3f)) se(par fmt(%9.3f))) style(tex)  order(alpha alpha100100 alpha5050 yearrate yearrate100100 yearrate5050 omega) stats(N r2)  estout col1 col2 col3 col4 col5 col6 col7, cells(b(fmt(%9.3f)) se(par fmt(%9.3f))) style(tex)  order(alpha alpha100100 alpha5050 yearrate yearrate100100 yearrate5050 omega) stats(N r2)    /* ANOVA Result noted on page 14 and Figure 2 */anova cons1 risk100100*irate*k irate*k irate k if risk100100==1 | risk5050==1anova cons1 risk100100*irate*k risk100100*irate risk100100*k risk100100 irate*k irate k if risk100100==1 | risk5050==1test risk100100*irate*k risk100100*irate risk100100*k risk100100/* Back-Up Regression *//* xi: can't do three way interactions, so make the irate*k dummies */capture drop iratekintgen iratekint = irate*kxi: reg cons1 i.risk100100*i.iratekint if risk100100==1 | risk5050==1, clu(labnumber)est store col1test _Irisk10010_1  _IrisXira_1_2   _IrisXira_1_3   _IrisXira_1_4   _IrisXira_1_5   _IrisXira_1_6   _IrisXira_1_7   _IrisXira_1_8   _IrisXira_1_9  _IrisXira_1_10  _IrisXira_1_11 _IrisXira_1_12  _IrisXira_1_13  _IrisXira_1_14  capture drop cons1hat cons1hatse cons1hatlow cons1hathighpredict cons1hatpredict cons1hatse, stdpgen cons1hatlow = cons1hat - 1.96*cons1hatsegen cons1hathigh = cons1hat + 1.96*cons1hatsetwoway (rcap cons1hatlow cons1hathigh theta if risk100100 == 1| risk5050 == 1, color(black) sort) (connected cons1hat theta if risk100100 == 1, color(blue) sort lpattern(dash)) (connected cons1hat theta if risk5050 == 1, color(red) sort lpattern(dash)) if labnumber==1, legend(order(2 "(p1,p2) = (1,1)" 3 "(p1,p2) = (0.5,0.5)" 1 "+/- 1.96 S.E.") rows(1) size(vsmall)) by(k) ytitle("Mean Earlier Choice ($)")  xtitle("Gross Interest Rate = (1+r)") ylabel(0(5)20, angle(horizontal)) xlabel(1(0.1)1.44) scheme(s1mono)/* ANOVA Result noted on page 20 and Figure 5 */anova cons1 risk10080*irate*k irate*k irate k if risk10080==1 | risk5040==1xi: reg cons1 i.risk10080*i.iratekint if risk10080==1 | risk5040==1, clu(labnumber)est store col2test _Irisk10080_1  _IrisXira_1_2   _IrisXira_1_3   _IrisXira_1_4   _IrisXira_1_5   _IrisXira_1_6   _IrisXira_1_7   _IrisXira_1_8   _IrisXira_1_9  _IrisXira_1_10  _IrisXira_1_11 _IrisXira_1_12  _IrisXira_1_13  _IrisXira_1_14  anova cons1 risk80100*irate*k irate*k irate k if risk80100==1 | risk4050==1xi: reg cons1 i.risk80100*i.iratekint if risk80100==1 | risk4050==1,  clu(labnumber)est store col3test _Irisk80100_1  _IrisXira_1_2   _IrisXira_1_3   _IrisXira_1_4   _IrisXira_1_5   _IrisXira_1_6   _IrisXira_1_7   _IrisXira_1_8   _IrisXira_1_9  _IrisXira_1_10  _IrisXira_1_11 _IrisXira_1_12  _IrisXira_1_13  _IrisXira_1_14  estout col1 col2 col3 , cells(b(fmt(%9.3f) star) se(par fmt(%9.3f) )     ) style(tex)   stats(N r2)  log off/********* Individual Level Analysis **************/tsset labnumber budgetnumcapture drop temp gen temp = cons1[_n+42]replace temp = . if budgetnum > 42capture drop temp2gen temp2 = (cons1!=temp)replace temp2 = . if budgetnum > 42gen distance = ((cons1-temp)/(20/irate)) replace distance = abs((cons1-temp)/(20/irate)) if choiceblock == 1 | choiceblock == 2replace distance = . if budgetnum > 42capture drop count100100capture drop distance100100bysort labnumber: egen count100100 = total(temp2) if choiceblock == 1 | choiceblock == 2bysort labnumber: replace count100100 = count100100[1]gen noviol100100 = (count100100 ==0)bysort labnumber: egen distance100100 = mean(distance) if choiceblock == 1 | choiceblock == 2bysort labnumber: replace distance100100 = distance100100[1]capture drop count10080capture drop distance10080bysort labnumber: egen count10080 = total(temp2) if choiceblock == 3 | choiceblock == 4bysort labnumber: replace count10080 = count10080[15]gen noviol10080 = (count10080 ==0)bysort labnumber: egen distance10080 = mean(distance) if choiceblock == 3 | choiceblock == 4bysort labnumber: replace distance10080 = distance10080[15]capture drop count80100capture drop distance80100bysort labnumber: egen count80100 = total(temp2) if choiceblock == 5 | choiceblock == 6bysort labnumber: replace count80100 = count80100[29]gen noviol80100 = (count80100 ==0)bysort labnumber: egen distance80100 = mean(distance) if choiceblock == 5 | choiceblock == 6bysort labnumber: replace distance80100 = distance80100[29]log on/* Individual Violations */su count* distance100100 distance10080 distance80100 noviol* if budgetnum ==1ttest distance10080 = 0 if budgetnum == 1ttest distance80100 = 0 if budgetnum == 1 pwcorr count100100 count10080 count80100 distance100100 distance10080 distance80100 if budgetnum ==1, siglog off