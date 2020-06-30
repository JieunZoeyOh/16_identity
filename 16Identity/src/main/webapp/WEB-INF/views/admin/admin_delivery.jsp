<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Jquery DataTable | Bootstrap Based Admin Template - Material Design</title>
    <!-- Favicon-->
    <link rel="icon" href="resources/favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="resources/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="resources/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="resources/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- JQuery DataTable Css -->
    <link href="resources/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom Css -->
    <link href="resources/css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="resources/css/themes/all-themes.css" rel="stylesheet" />
</head>

<body class="theme-brown">
	<jsp:include page="top.jsp"></jsp:include>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    재고관리 - 배송
                    <small>관리자 <b>배송</b> 페이지 입니다.</small>
                </h2>
            </div>
            <!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                배송 목록
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <button type="button" class="btn bg-brown waves-effect">배송 완료</button>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                    <thead>
                                        <tr>
                                            <th>회원ID</th>
                                            <th>주소</th>
                                            <th>핸드폰</th>
                                            <th>ISBN</th>
                                            <th>책제목</th>
                                            <th>출판사</th>
                                            <th>저자</th>
                                            <th>정가</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$17,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            <td>66</td>
                                            <td>2009/01/12</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$8,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Cedric Kelly</td>
                                            <td>Senior Javascript Developer</td>
                                            <td>Edinburgh</td>
                                            <td>22</td>
                                            <td>2012/03/29</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$43,600</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Airi Satou</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>33</td>
                                            <td>2008/11/28</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$16,200</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Brielle Williamson</td>
                                            <td>Integration Specialist</td>
                                            <td>New York</td>
                                            <td>61</td>
                                            <td>2012/12/02</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$7,200</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Herrod Chandler</td>
                                            <td>Sales Assistant</td>
                                            <td>San Francisco</td>
                                            <td>59</td>
                                            <td>2012/08/06</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$30,200</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Rhona Davidson</td>
                                            <td>Integration Specialist</td>
                                            <td>Tokyo</td>
                                            <td>55</td>
                                            <td>2010/10/14</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$27,900</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Colleen Hurst</td>
                                            <td>Javascript Developer</td>
                                            <td>San Francisco</td>
                                            <td>39</td>
                                            <td>2009/09/15</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,500</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Sonya Frost</td>
                                            <td>Software Engineer</td>
                                            <td>Edinburgh</td>
                                            <td>23</td>
                                            <td>2008/12/13</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$13,600</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Jena Gaines</td>
                                            <td>Office Manager</td>
                                            <td>London</td>
                                            <td>30</td>
                                            <td>2008/12/19</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Quinn Flynn</td>
                                            <td>Support Lead</td>
                                            <td>Edinburgh</td>
                                            <td>22</td>
                                            <td>2013/03/03</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Charde Marshall</td>
                                            <td>Regional Director</td>
                                            <td>San Francisco</td>
                                            <td>36</td>
                                            <td>2008/10/16</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Haley Kennedy</td>
                                            <td>Senior Marketing Designer</td>
                                            <td>London</td>
                                            <td>43</td>
                                            <td>2012/12/18</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Tatyana Fitzpatrick</td>
                                            <td>Regional Director</td>
                                            <td>London</td>
                                            <td>19</td>
                                            <td>2010/03/17</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Michael Silva</td>
                                            <td>Marketing Designer</td>
                                            <td>London</td>
                                            <td>66</td>
                                            <td>2012/11/27</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Paul Byrd</td>
                                            <td>Chief Financial Officer (CFO)</td>
                                            <td>New York</td>
                                            <td>64</td>
                                            <td>2010/06/09</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Gloria Little</td>
                                            <td>Systems Administrator</td>
                                            <td>New York</td>
                                            <td>59</td>
                                            <td>2009/04/10</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Bradley Greer</td>
                                            <td>Software Engineer</td>
                                            <td>London</td>
                                            <td>41</td>
                                            <td>2012/10/13</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Dai Rios</td>
                                            <td>Personnel Lead</td>
                                            <td>Edinburgh</td>
                                            <td>35</td>
                                            <td>2012/09/26</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Jenette Caldwell</td>
                                            <td>Development Lead</td>
                                            <td>New York</td>
                                            <td>30</td>
                                            <td>2011/09/03</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Yuri Berry</td>
                                            <td>Chief Marketing Officer (CMO)</td>
                                            <td>New York</td>
                                            <td>40</td>
                                            <td>2009/06/25</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Caesar Vance</td>
                                            <td>Pre-Sales Support</td>
                                            <td>New York</td>
                                            <td>21</td>
                                            <td>2011/12/12</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Doris Wilder</td>
                                            <td>Sales Assistant</td>
                                            <td>Sidney</td>
                                            <td>23</td>
                                            <td>2010/09/20</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Angelica Ramos</td>
                                            <td>Chief Executive Officer (CEO)</td>
                                            <td>London</td>
                                            <td>47</td>
                                            <td>2009/10/09</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Gavin Joyce</td>
                                            <td>Developer</td>
                                            <td>Edinburgh</td>
                                            <td>42</td>
                                            <td>2010/12/22</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Jennifer Chang</td>
                                            <td>Regional Director</td>
                                            <td>Singapore</td>
                                            <td>28</td>
                                            <td>2010/11/14</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Brenden Wagner</td>
                                            <td>Software Engineer</td>
                                            <td>San Francisco</td>
                                            <td>28</td>
                                            <td>2011/06/07</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Fiona Green</td>
                                            <td>Chief Operating Officer (COO)</td>
                                            <td>San Francisco</td>
                                            <td>48</td>
                                            <td>2010/03/11</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Shou Itou</td>
                                            <td>Regional Marketing</td>
                                            <td>Tokyo</td>
                                            <td>20</td>
                                            <td>2011/08/14</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Michelle House</td>
                                            <td>Integration Specialist</td>
                                            <td>Sidney</td>
                                            <td>37</td>
                                            <td>2011/06/02</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Suki Burks</td>
                                            <td>Developer</td>
                                            <td>London</td>
                                            <td>53</td>
                                            <td>2009/10/22</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Prescott Bartlett</td>
                                            <td>Technical Author</td>
                                            <td>London</td>
                                            <td>27</td>
                                            <td>2011/05/07</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Gavin Cortez</td>
                                            <td>Team Leader</td>
                                            <td>San Francisco</td>
                                            <td>22</td>
                                            <td>2008/10/26</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Martena Mccray</td>
                                            <td>Post-Sales support</td>
                                            <td>Edinburgh</td>
                                            <td>46</td>
                                            <td>2011/03/09</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Unity Butler</td>
                                            <td>Marketing Designer</td>
                                            <td>San Francisco</td>
                                            <td>47</td>
                                            <td>2009/12/09</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Howard Hatfield</td>
                                            <td>Office Manager</td>
                                            <td>San Francisco</td>
                                            <td>51</td>
                                            <td>2008/12/16</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Hope Fuentes</td>
                                            <td>Secretary</td>
                                            <td>San Francisco</td>
                                            <td>41</td>
                                            <td>2010/02/12</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Vivian Harrell</td>
                                            <td>Financial Controller</td>
                                            <td>San Francisco</td>
                                            <td>62</td>
                                            <td>2009/02/14</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Timothy Mooney</td>
                                            <td>Office Manager</td>
                                            <td>London</td>
                                            <td>37</td>
                                            <td>2008/12/11</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Jackson Bradshaw</td>
                                            <td>Director</td>
                                            <td>New York</td>
                                            <td>65</td>
                                            <td>2008/09/26</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Olivia Liang</td>
                                            <td>Support Engineer</td>
                                            <td>Singapore</td>
                                            <td>64</td>
                                            <td>2011/02/03</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Bruno Nash</td>
                                            <td>Software Engineer</td>
                                            <td>London</td>
                                            <td>38</td>
                                            <td>2011/05/03</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Sakura Yamamoto</td>
                                            <td>Support Engineer</td>
                                            <td>Tokyo</td>
                                            <td>37</td>
                                            <td>2009/08/19</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Thor Walton</td>
                                            <td>Developer</td>
                                            <td>New York</td>
                                            <td>61</td>
                                            <td>2013/08/11</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Finn Camacho</td>
                                            <td>Support Engineer</td>
                                            <td>San Francisco</td>
                                            <td>47</td>
                                            <td>2009/07/07</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Serge Baldwin</td>
                                            <td>Data Coordinator</td>
                                            <td>Singapore</td>
                                            <td>64</td>
                                            <td>2012/04/09</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Zenaida Frank</td>
                                            <td>Software Engineer</td>
                                            <td>New York</td>
                                            <td>63</td>
                                            <td>2010/01/04</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Zorita Serrano</td>
                                            <td>Software Engineer</td>
                                            <td>San Francisco</td>
                                            <td>56</td>
                                            <td>2012/06/01</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Jennifer Acosta</td>
                                            <td>Junior Javascript Developer</td>
                                            <td>Edinburgh</td>
                                            <td>43</td>
                                            <td>2013/02/01</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Cara Stevens</td>
                                            <td>Sales Assistant</td>
                                            <td>New York</td>
                                            <td>46</td>
                                            <td>2011/12/06</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Hermione Butler</td>
                                            <td>Regional Director</td>
                                            <td>London</td>
                                            <td>47</td>
                                            <td>2011/03/21</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Lael Greer</td>
                                            <td>Systems Administrator</td>
                                            <td>London</td>
                                            <td>21</td>
                                            <td>2009/02/27</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Jonas Alexander</td>
                                            <td>Developer</td>
                                            <td>San Francisco</td>
                                            <td>30</td>
                                            <td>2010/07/14</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Shad Decker</td>
                                            <td>Regional Director</td>
                                            <td>Edinburgh</td>
                                            <td>51</td>
                                            <td>2008/11/13</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Michael Bruce</td>
                                            <td>Javascript Developer</td>
                                            <td>Singapore</td>
                                            <td>29</td>
                                            <td>2011/06/27</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                        <tr>
                                            <td>Donna Snider</td>
                                            <td>Customer Support</td>
                                            <td>New York</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>adam smithas</td>
                                            <td>Smith</td>
                                            <td>$20,800</td>
                                            <td>배송 예정</td>
                                        </tr>
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Exportable Table -->
        </div>
    </section>

    <!-- Jquery Core Js -->
    <script src="resources/plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="resources/plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="resources/plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="resources/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="resources/plugins/node-waves/waves.js"></script>

    <!-- Jquery DataTable Plugin Js -->
    <script src="resources/plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="resources/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

    <!-- Custom Js -->
    <script src="resources/js/admin.js"></script>
    <script src="resources/js/pages/tables/jquery-datatable.js"></script>

    <!-- Demo Js -->
    <script src="resources/js/demo.js"></script>
</body>

</html>
