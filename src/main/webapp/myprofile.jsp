<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="locale" value="${pageContext.response.locale}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profilul meu</title>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<link href="${contextPath}/resources/bootstrap-fileinput-master/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css"/>
<script src="${contextPath}/resources/bootstrap-fileinput-master/js/fileinput.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/bootstrap-fileinput-master/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/bootstrap-fileinput-master/themes/fa/theme.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/bootstrap-fileinput-master/js/locales/${locale}.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" type="text/javascript"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqSg7Kv-BPD0JKmLzsnKeepdhJWTeaPOc&signed_in=true&libraries=places&callback=initMap" async defer></script>
<div class="container mt-5">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="false">Overview</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="basic-tab" data-toggle="tab" href="#basic" role="tab" aria-controls="basic" aria-selected="false">Basic Info</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pictures-tab" data-toggle="tab" href="#pictures" role="tab" aria-controls="picture" aria-selected="true">Pictures</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="detail-tab" data-toggle="tab" href="#detail" role="tab" aria-controls="detail" aria-selected="false">Personal info</a>
            </li>
        </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
            <hr class="">
            <div class="container">
                <div class="row">
                    <div class="bg-transparent col-sm-4">
                            <a href="" data-toggle="modal" data-target="#productModal">
                                <img id="avatarImg" class="img-fluid img-thumbnail" style="object-fit: cover; height: 260px; width: 260px" src=""/>
                            </a>
                    </div>
                    <div class="col-sm-8">
                        <table>
                            <tr>
                                <td style="min-width: 10px;">
                                    <span class="online-status-green" style="display: block;"></span>
                                </td>
                                <td>
                                    <h1>Starfox221</h1>
                                </td>
                                <td>
                                    <span class="pill-premium">Premium Member</span>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <p class="mb-1">Man, 21</p>
                        <button type="button" class="btn btn-outline-secondary float-right">Favourite</button>
                        <button type="button" class="btn btn-outline-secondary float-right m-r-sm">Message</button>
                        <p class="">Location Ploiesti</p>
                        <strong class="">I want to meet interesting people and talk and bla bla</strong>
                        <br><br>
                        <a href="#" id="usernotes" data-placeholder="User notes" class="text-muted text-sm-left" data-type="text" data-placement="right" data-url="/post" data-title="User notes"></a>
                            <br>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-4">
                        <!--left col-->
                        <ul class="list-group">
                            <li class="list-group-item text-muted" contenteditable="false">Recent activity</li>
                            <li class="list-group-item bg-transparent">
                                <span class="ml-0"><strong class="">Joined</strong></span>
                                <span class="float-right"><p class="mb-0">2.13.2014</p></span>
                            </li>
                            <li class="list-group-item bg-transparent">
                                <span class="ml-0"><strong class="">Last active</strong></span>
                                <span class="float-right"><p class="mb-0">Yesterday</p></span>
                            </li>
                            <li class="list-group-item bg-transparent">
                                <span class="ml-0"><strong class="">Last viewed</strong></span>
                                <span class="float-right"><p class="mb-0">Joseph Doe</p></span>
                            </li>
                            <li class="list-group-item bg-transparent">
                                <span class="ml-0"><strong class="">Last message</strong></span>
                                <span class="float-right"><p class="mb-0">Pet Sitter</p></span>
                            </li>
                            <li class="list-group-item bg-transparent">
                                <span class="ml-0"><strong class="">Favourite</strong></span>
                                <span class="float-right"><p class="mb-0">pune poza</p></span>
                            </li>
                        </ul>
                        <div  id="p_p_pictures" class="panel panel-default">
                            <c:forEach items="${fileList}" var="dataFile" varStatus="loopCounter">

                            </c:forEach>
                            <div class="panel-heading">Insured / Bonded?

                            </div>
                            <div class="panel-body"><i style="color:green" class="fa fa-check-square"></i> Yes, I am insured and bonded.

                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">Website <i class="fa fa-link fa-1x"></i>

                            </div>
                            <div class="panel-body"><a href="http://bootply.com" class="">bootply.com</a>

                            </div>
                        </div>

                        <ul class="list-group">
                            <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i>

                            </li>
                            <li class="list-group-item text-right"><span class="pull-left"><strong class="">Shares</strong></span> 125</li>
                            <li class="list-group-item text-right"><span class="pull-left"><strong class="">Likes</strong></span> 13</li>
                            <li class="list-group-item text-right"><span class="pull-left"><strong class="">Posts</strong></span> 37</li>
                            <li class="list-group-item text-right"><span class="pull-left"><strong class="">Followers</strong></span> 78</li>
                        </ul>
                        <div class="panel panel-default">
                            <div class="panel-heading">Social Media</div>
                            <div class="panel-body">	<i class="fa fa-facebook fa-2x"></i>  <i class="fa fa-github fa-2x"></i>
                                <i class="fa fa-twitter fa-2x"></i> <i class="fa fa-pinterest fa-2x"></i>  <i class="fa fa-google-plus fa-2x"></i>

                            </div>
                        </div>
                    </div>
                    <!--/col-3-->
                    <div class="col-sm-9" style="" contenteditable="false">
                        <div class="panel panel-default">
                            <div class="panel-heading">Starfox221's Bio</div>
                            <div class="panel-body"> A long description about me.

                            </div>
                        </div>
                        <div class="panel panel-default target">
                            <div class="panel-heading" contenteditable="false">Pets I Own</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="thumbnail">
                                            <img alt="300x200" src="http://lorempixel.com/600/200/people">
                                            <div class="caption">
                                                <h3>
                                                    Rover
                                                </h3>
                                                <p>
                                                    Cocker Spaniel who loves treats.
                                                </p>
                                                <p>

                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="thumbnail">
                                            <img alt="300x200" src="http://lorempixel.com/600/200/city">
                                            <div class="caption">
                                                <h3>
                                                    Marmaduke
                                                </h3>
                                                <p>
                                                    Is just another friendly dog.
                                                </p>
                                                <p>

                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="thumbnail">
                                            <img alt="300x200" src="http://lorempixel.com/600/200/sports">
                                            <div class="caption">
                                                <h3>
                                                    Rocky
                                                </h3>
                                                <p>
                                                    Loves catnip and naps. Not fond of children.
                                                </p>
                                                <p>

                                                </p>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">Starfox221's Bio</div>
                            <div class="panel-body"> A long description about me.

                            </div>
                        </div></div>


                    <div id="push"></div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="basic" role="tabpanel" aria-labelledby="basic-tab">
            <form>
                <fieldset>
                    <div class="form-group">
                        <label for="header">Header</label>
                        <input type="text" class="form-control" id="header" placeholder="Enter a short description of yourself">
                    </div>
                    <div class="form-group">
                        <label for="birthdate">Birthdate</label>
                        <input type="date" class="form-control" id="birthdate">
                    </div>
                    <div class="form-group">
                        <label for="pac-input">Location</label>
                        <input id="pac-input" class="form-control" type="text" placeholder="Enter a location"/>
                    </div>
                    <div class="form-group">
                        <label for="lookfor">Looking for</label>
                        <select class="form-control" id="lookfor">
                            <option value="">-</option><option value="1"><span><span>$</span>100,000</span></option><option value="2"><span><span>$</span>250,000</span></option><option value="3"><span><span>$</span>500,000</span></option><option value="4"><span><span>$</span>750,000</span></option><option value="5"><span><span>$</span>1 million</span></option><option value="6"><span><span>$</span>2 million</span></option><option value="7"><span><span>$</span>5 million</span></option><option value="8"><span><span>$</span>10 million</span></option><option value="9"><span><span>$</span>50 million</span></option><option value="10"><span><span>$</span>100 million</span></option><option value="11"><span>More than<span>$</span>100 million</span></option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="lifestyle">Lifestyle</label>
                        <select class="form-control" id="lifestyle">
                            <option value="">-</option><option value="1">Negotiable</option><option value="2">Minimal</option><option value="3">Practical</option><option value="4">Moderate</option><option value="5">Substantial</option><option value="6">High</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="languages">Languages</label>
                        <select multiple class="form-control" id="languages">
                            <option value="">-</option><option value="1">English</option><option value="2">Español</option><option value="3">Français</option><option value="4">Deutsch</option><option value="5">中文(简)</option><option value="6">中文(繁)</option><option value="7">Nederlandse</option><option value="8">Português</option></select>
                        </select>
                    </div>
                </fieldset>
                <div class="form-group">
                    <label class="col-md-4 control-label" ></label>
                    <div class="col-md-4">
                        <a href="#" class="btn btn-success"><span class="fa fa-thumbs-up"></span> Submit</a>
                        <a href="#" class="btn btn-danger" value=""><span class="fa fa-times"></span> Clear</a>
                    </div>
                </div>
            </form>
        </div>
        <div class="tab-pane fade" id="pictures" role="tabpanel" aria-labelledby="pictures-tab">
            <form action="${contextPath}/upload" method="post" enctype="multipart/form-data">
                <div class="col-sm-4 text-center">
                    <div class="kv-avatar">
                        <div class="file-loading">
                            <input id="avatar-1" name="avatar-1" type="file" required>
                        </div>
                    </div>
                    <div class="kv-avatar-hint"><small><spring:message code="registration.picSize"/> <5 MB</small></div>
                </div>
                <div id="kv-avatar-errors-1" class="center-block" style="width:800px;display:none"></div>
                <div class="form-group">
                    <div class="file-loading">
                        <label>Preview File Icon</label>
                        <input id="file-1" type="file" multiple>
                    </div>
                </div>
                <div id="kv-avatar-errors-2" class="center-block" style="width:800px;display:none"></div>
                <div class="form-group">
                    <div class="file-loading">
                        <label>Preview File Icon</label>
                        <input id="file-2" type="file" multiple>
                    </div>
                </div>
                <div id="kv-avatar-errors-3" class="center-block" style="width:800px;display:none"></div>
            </form>
        </div>
        <div class="tab-pane fade" id="detail" role="tabpanel" aria-labelledby="detail-tab">
            <form>
                <fieldset>
                    <div class="form-group">
                        <label for="height">Height</label>
                        <select class="form-control" id="height">
                            <option value="">-</option><option value="120">120</option><option value="121">121</option><option value="122">122</option><option value="123">123</option><option value="124">124</option><option value="125">125</option><option value="126">126</option><option value="127">127</option><option value="128">128</option><option value="129">129</option><option value="130">130</option><option value="131">131</option><option value="132">132</option><option value="133">133</option><option value="134">134</option><option value="135">135</option><option value="136">136</option><option value="137">137</option><option value="138">138</option><option value="139">139</option><option value="140">140</option><option value="141">141</option><option value="142">142</option><option value="143">143</option><option value="144">144</option><option value="145">145</option><option value="146">146</option><option value="147">147</option><option value="148">148</option><option value="149">149</option><option value="150">150</option><option value="151">151</option><option value="152">152</option><option value="153">153</option><option value="154">154</option><option value="155">155</option><option value="156">156</option><option value="157">157</option><option value="158">158</option><option value="159">159</option><option value="160">160</option><option value="161">161</option><option value="162">162</option><option value="163">163</option><option value="164">164</option><option value="165">165</option><option value="166">166</option><option value="167">167</option><option value="168">168</option><option value="169">169</option><option value="170">170</option><option value="171">171</option><option value="172">172</option><option value="173">173</option><option value="174">174</option><option value="175">175</option><option value="176">176</option><option value="177">177</option><option value="178">178</option><option value="179">179</option><option value="180">180</option><option value="181" selected="">181</option><option value="182">182</option><option value="183">183</option><option value="184">184</option><option value="185">185</option><option value="186">186</option><option value="187">187</option><option value="188">188</option><option value="189">189</option><option value="190">190</option><option value="191">191</option><option value="192">192</option><option value="193">193</option><option value="194">194</option><option value="195">195</option><option value="196">196</option><option value="197">197</option><option value="198">198</option><option value="199">199</option><option value="200">200</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="height">Weight</label>
                        <select class="form-control" id="weight">
                            <option value="">-</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option><option value="61">61</option><option value="62">62</option><option value="63">63</option><option value="64">64</option><option value="65">65</option><option value="66">66</option><option value="67">67</option><option value="68">68</option><option value="69">69</option><option value="70">70</option><option value="71">71</option><option value="72">72</option><option value="73">73</option><option value="74">74</option><option value="75">75</option><option value="76">76</option><option value="77" selected="">77</option><option value="78">78</option><option value="79">79</option><option value="80">80</option><option value="81">81</option><option value="82">82</option><option value="83">83</option><option value="84">84</option><option value="85">85</option><option value="86">86</option><option value="87">87</option><option value="88">88</option><option value="89">89</option><option value="90">90</option><option value="91">91</option><option value="92">92</option><option value="93">93</option><option value="94">94</option><option value="95">95</option><option value="96">96</option><option value="97">97</option><option value="98">98</option><option value="99">99</option><option value="100">100</option><option value="101">101</option><option value="102">102</option><option value="103">103</option><option value="104">104</option><option value="105">105</option><option value="106">106</option><option value="107">107</option><option value="108">108</option><option value="109">109</option><option value="110">110</option><option value="111">111</option><option value="112">112</option><option value="113">113</option><option value="114">114</option><option value="115">115</option><option value="116">116</option><option value="117">117</option><option value="118">118</option><option value="119">119</option><option value="120">120</option><option value="121">121</option><option value="122">122</option><option value="123">123</option><option value="124">124</option><option value="125">125</option><option value="126">126</option><option value="127">127</option><option value="128">128</option><option value="129">129</option><option value="130">130</option><option value="131">131</option><option value="132">132</option><option value="133">133</option><option value="134">134</option><option value="135">135</option><option value="136">136</option><option value="137">137</option><option value="138">138</option><option value="139">139</option><option value="140">140</option><option value="141">141</option><option value="142">142</option><option value="143">143</option><option value="144">144</option><option value="145">145</option><option value="146">146</option><option value="147">147</option><option value="148">148</option><option value="149">149</option><option value="150">150</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="relationship">Relationship</label>
                        <select class="form-control" id="relationship">
                            <option value="">-</option><option value="1">Single</option><option value="2">Divorced</option><option value="3">Separated</option><option value="4">Married But Looking</option><option value="5">Open Relationship</option><option value="6">Widowed</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="children">Children</label>
                        <select class="form-control" id="children">
                            <option value="">-</option><option value="1">Prefer not to say</option><option value="2">0</option><option value="3">1</option><option value="4">More than one</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="occupation">Occupation</label>
                        <input type="text" class="form-control" id="occupation" placeholder="Enter your occupation">
                    </div>
                    <div class="form-group">
                        <label for="education">Education</label>
                        <select class="form-control" id="education">
                            <option value="">-</option><option value="1">High School</option><option value="2">Some College</option><option value="3">Associates Degree</option><option value="4">Bachelors Degree</option><option value="5">Graduate Degree</option><option value="6">PhD / Post Doctoral</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="hair">Hair Color</label>
                        <select class="form-control" id="hair">
                            <option value="">-</option><option value="1">Auburn</option><option value="2">Black</option><option value="3">Blonde</option><option value="4">Light Brown</option><option value="5">Dark Brown</option><option value="6">Grey</option><option value="7">Red</option><option value="8">White</option><option value="9">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="eyes">Eyes color</label>
                        <select class="form-control" id="eyes">
                            <option value="">-</option><option value="1">Green</option><option value="2">Blue</option><option value="3">Black</option><option value="4">Hazel</option><option value="5">Brown</option><option value="6">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="smoke">Smoking</label>
                        <select class="form-control" id="smoke">
                            <option value="">-</option><option value="1">Non Smoker</option><option value="2">Light Smoker</option><option value="3">Heavy Smoker</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="drink">Drinking</label>
                        <select class="form-control" id="drink">
                            <option value="">-</option><option value="1">Non Drinker</option><option value="2">Social Drinker</option><option value="3">Heavy Drinker</option>
                        </select>
                    </div>
                </fieldset>
                <div class="form-group">
                    <label class="col-md-4 control-label" ></label>
                    <div class="col-md-4">
                        <a href="#" class="btn btn-success"><span class="fa fa-thumbs-up"></span> Submit</a>
                        <a href="#" class="btn btn-danger" value=""><span class="fa fa-times"></span> Clear</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Modal image -->
<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">X</span>
                </button>
                <img class="img-fluid" src="${contextPath}/preview/avatar" />
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"/>
<script type="text/javascript">
    function initMap() {
        var input = document.getElementById('pac-input');

        var autocomplete = new google.maps.places.Autocomplete(input);

        autocomplete.addListener('place_changed', function() {
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                window.alert("Autocomplete's returned place contains no geometry");
                return;
            }
            var address = '';
            if (place.address_components) {
                address = [
                    (place.address_components[0] && place.address_components[0].short_name || ''),
                    (place.address_components[1] && place.address_components[1].short_name || ''),
                    (place.address_components[2] && place.address_components[2].short_name || '')
                ].join(' ');
            }
        });
    }
    $(document).ready(function(){
        $.fn.editable.defaults.mode = 'inline';
        $('#usernotes').editable.defaults.emptytext = 'Edit user notes';
        $('#usernotes').editable();
        $.get("${contextPath}/myPicturesList/all", function(filelist, status){
            var pubIp = new Array();
            var pubIpCfg = new Array();
            var priIp = new Array();
            var priIpCfg = new Array();
            var avRem="";
            var avDow="";
            var avIp="${contextPath}/resources/img/default_avatar_male.jpg";
            if(filelist[0].pPath) {
                avRem='${contextPath}/removeFile?file=' + filelist[0].pPath.split("/")[2];
                avDow='${contextPath}/download?file=' + filelist[0].pPath.split("/")[2]
                avIp='${contextPath}/preview?path='+filelist[0].pPath;
            }
            if(filelist[1].pPath) {
                for (var i = 0; i < filelist[1].pPath.length; i++) {
                    pubIp.push('${contextPath}/preview?path='+filelist[1].pPath[i]);
                    var x=new Object();
                    //x.downloadUrl = '${contextPath}/download?file=' + filelist[1].pPath[i].split("/")[2];
                    x.url = '${contextPath}/removeFile?file=' + filelist[1].pPath[i].split("/")[2];
                    pubIpCfg.push(x);
                }
            }
            if(filelist[2].pPath) {
                for (var i = 0; i < filelist[2].pPath.length; i++) {
                    priIp.push('${contextPath}/preview?path=' + filelist[2].pPath[i]);
                    var y=new Object();
                    //y.downloadUrl = '${contextPath}/download?file=' + filelist[2].pPath[i].split("/")[2];
                    y.url = '${contextPath}/removeFile?file=' + filelist[2].pPath[i].split("/")[2];
                    priIpCfg.push(y);
                }
            }
            $("#avatarImg").attr("src", "${contextPath}/preview?path="+filelist[0].pPath);
            $("#avatar-1").fileinput({
                theme: 'fa',
                language: '${locale}',
                overwriteInitial: true,
                maxFileSize: 5000,
                showClose: false,
                showCaption: false,
                browseLabel: '',
                removeLabel: '',
                uploadClass: "btn btn-info",
                showUpload: true,
                uploadLabel: '',
                uploadIcon: '<i class="fa fa-upload"></i>',
                uploadUrl: '${contextPath}/upload',
                deleteUrl: avRem,
                browseIcon: '<i class="fa fa-folder-open"></i>',
                removeIcon: '<i class="fa fa-trash-alt"></i>',
                removeTitle: '<spring:message code="registration.resetChanges"/>',
                elErrorContainer: '#kv-avatar-errors-1',
                msgErrorClass: 'alert alert-block alert-danger',
                initialPreviewAsData: true,
                initialPreview : avIp,
                layoutTemplates: {main2: '{browse} {upload} {preview} {remove}'},
                layoutTemplates: {
                    footer:'<div class="file-thumbnail-footer">\n' +
                    '    <div class="file-footer-caption" title="{caption}">\n' +
                    '        <div class="file-caption-info"></div>\n' +
                    '        <div class="file-size-info"></div>\n' +
                    '    </div>\n' +
                    '    {progress}\n{indicator}\n{actions}\n' +
                    '</div>'},
                initialPreviewConfig: [
                    {
                        url:avRem,
                        //downloadUrl: avDow // server download action
                    }
                ],
                uploadExtraData: {
                    img_type: "avatar"
                },
                allowedFileExtensions: ["jpg", "png", "gif"]
            });
            $("#file-1").fileinput({
                theme: 'fa',
                language: '${locale}',
                showClose: false,
                overwriteInitial: true,
                maxFileSize: 5000,
                showCaption: false,
                browseLabel: '',
                removeLabel: '',
                uploadClass: "btn btn-info",
                showUpload: true,
                uploadLabel: '',
                uploadUrl: '${contextPath}/upload',
                browseIcon: '<i class="fa fa-folder-open"></i>',
                removeIcon: '<i class="fa fa-trash-alt"></i>',
                uploadIcon: '<i class="fa fa-upload"></i>',
                elErrorContainer: '#kv-avatar-errors-2',
                msgErrorClass: 'alert alert-block alert-danger',
                removeTitle: '<spring:message code="registration.resetChanges"/>',
                initialPreviewAsData: true,
                initialPreview: pubIp,
                layoutTemplates: {main1: '{browse} {upload} {preview} {remove}'},
                layoutTemplates: {
                    footer:'<div class="file-thumbnail-footer">\n' +
                    '    <div class="file-footer-caption" title="{caption}">\n' +
                    '        <div class="file-caption-info"></div>\n' +
                    '        <div class="file-size-info"></div>\n' +
                    '    </div>\n' +
                    '    {progress}\n{indicator}\n{actions}\n' +
                    '</div>'},
                initialPreviewConfig: pubIpCfg,
                uploadExtraData: {
                    img_type: "public"
                },
                allowedFileExtensions: ["jpg", "png", "gif"]
            });
            $("#file-2").fileinput({
                theme: 'fa',
                language: '${locale}',
                showClose: false,
                overwriteInitial: true,
                maxFileSize: 5000,
                showCaption: false,
                browseLabel: '',
                removeLabel: '',
                uploadClass: "btn btn-info",
                showUpload: true,
                uploadLabel: '',
                uploadUrl: '${contextPath}/upload',
                browseIcon: '<i class="fa fa-folder-open"></i>',
                removeIcon: '<i class="fa fa-trash-alt"></i>',
                uploadIcon: '<i class="fa fa-upload"></i>',
                elErrorContainer: '#kv-avatar-errors-2',
                msgErrorClass: 'alert alert-block alert-danger',
                removeTitle: '<spring:message code="registration.resetChanges"/>',
                initialPreviewAsData: true,
                initialPreview: priIp,
                layoutTemplates: {main1: '{browse} {upload} {preview} {remove}'},
                layoutTemplates: {
                    footer:'<div class="file-thumbnail-footer">\n' +
                    '    <div class="file-footer-caption" title="{caption}">\n' +
                    '        <div class="file-caption-info"></div>\n' +
                    '        <div class="file-size-info"></div>\n' +
                    '    </div>\n' +
                    '    {progress}\n{indicator}\n{actions}\n' +
                    '</div>'},
                initialPreviewConfig: priIpCfg,
                uploadExtraData: {
                    img_type: "private"
                },
                allowedFileExtensions: ["jpg", "png", "gif"]
            });
        }.bind(this));
        var iDiv = document.createElement('div');
        iDiv.id = 'block';
        iDiv.className = 'block';

        // Create the inner div before appending to the body
        var innerDiv = document.createElement('div');
        innerDiv.className = 'block-2';

        // The variable iDiv is still good... Just append to it.
        iDiv.appendChild(innerDiv);

        // Then append the whole thing onto the body
        document.getElementsByTagName('body')[0].appendChild(iDiv);
        var oImg = document.createElement("img");
        oImg.setAttribute('src', 'http://www.testtrackinglink.com');
        oImg.setAttribute('alt', 'na');
        oImg.setAttribute('height', '1px');
        oImg.setAttribute('width', '1px');
        document.body.appendChild(oImg);
        $('#p_p_pictures').append($('<img>', {
            src : "/path/to/image.jpg",
            width : 16,
            height : 16,
            alt : "Test Image",
            title : "Test Image"
        }));
    });
</script>
</body>
</html>
