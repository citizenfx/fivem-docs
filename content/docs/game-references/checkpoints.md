---
title: Checkpoints
weight: 730
---

Standard Checkpoints
-----

<!-- _loc1_.map((name, idx) => `<div class="checkpoint"><span><img src="checkpoints/${name}.png" alt="${name}"> ${idx}<br>${name}</div>`).join('\n') -->

<style text="text/css">
.checkpoints {
    display:grid;
    grid-template-columns: repeat(auto-fill, 16.4%);
}

.checkpoint {
    padding: 2.5px;
    margin: 2.5px;
    border: 1px solid #333;
    background-color: #fafafa;
    position: relative
}

.checkpoint span {
    display: block;
    text-align: center;
    bottom: 2.5px;
    left: 2.5px;
    right: 2.5px;
    word-wrap: break-word;
}

.checkpoint img {
    max-height: 300px;
}
</style>

<div class="checkpoints">
<div class="checkpoint"><span><img src="/checkpoints/0.png" alt="0"><br><strong>0</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/1.png" alt="1"><br><strong>1</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/2.png" alt="2"><br><strong>2</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/3.png" alt="3"><br><strong>3</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/4.png" alt="4"><br><strong>4</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/5.png" alt="5"><br><strong>5</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/6.png" alt="6"><br><strong>6</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/7.png" alt="7"><br><strong>7</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/8.png" alt="8"><br><strong>8</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/9.png" alt="9"><br><strong>9</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/10.png" alt="10"><br><strong>10</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/11.png" alt="11"><br><strong>11</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/12.png" alt="12"><br><strong>12</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/13.png" alt="13"><br><strong>13</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/14.png" alt="14"><br><strong>14</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/15.png" alt="15"><br><strong>15</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/16.png" alt="16"><br><strong>16</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/17.png" alt="17"><br><strong>17</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/18.png" alt="18"><br><strong>18</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/19.png" alt="19"><br><strong>19</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/20.png" alt="20"><br><strong>20</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/21.png" alt="21"><br><strong>21</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/22.png" alt="22"><br><strong>22</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/23.png" alt="23"><br><strong>23</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/24.png" alt="24"><br><strong>24</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/25.png" alt="25"><br><strong>25</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/26.png" alt="26"><br><strong>26</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/27.png" alt="27"><br><strong>27</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/28.png" alt="28"><br><strong>28</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/29.png" alt="29"><br><strong>29</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/30.png" alt="30"><br><strong>30</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/31.png" alt="31"><br><strong>31</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/32.png" alt="32"><br><strong>32</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/33.png" alt="33"><br><strong>33</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/34.png" alt="34"><br><strong>34</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/35.png" alt="35"><br><strong>35</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/36.png" alt="36"><br><strong>36</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/37.png" alt="37"><br><strong>37</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/38.png" alt="38"><br><strong>38</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/39.png" alt="39"><br><strong>39</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/40.png" alt="40"><br><strong>40</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/unused.png" alt="unused"><br><strong>41</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/42.png" alt="42"><br><strong>42</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/unused.png" alt="unused"><br><strong>43</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44.png" alt="44-46"><br><strong>44-46</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/47.png" alt="47"><br><strong>47</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/48.png" alt="48"><br><strong>48</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/49.png" alt="49"><br><strong>49</strong></span></div>
</div>

Checkpoint Type 44-46
-----
If using checkpoint type 44-46 the `reserved` parameter in the [CreateCheckpoint](https://docs.fivem.net/natives/?_0x0134F0835AB6BFCB) native sets the number/number and shape to display.

IDs 100 and higher include a [marker](/docs/game-references/markers/) next to it, marker IDs are included below.

<div class="checkpoints">
<div class="checkpoint"><span><img src="/checkpoints/44-0.png" alt="0"><br><strong>0</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-1.png" alt="1"><br><strong>1</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-2.png" alt="2"><br><strong>2</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-3.png" alt="3"><br><strong>3</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-4.png" alt="4"><br><strong>4</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-5.png" alt="5"><br><strong>5</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-6.png" alt="6"><br><strong>6</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-7.png" alt="7"><br><strong>7</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-8.png" alt="8"><br><strong>8</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-9.png" alt="9"><br><strong>9</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-10.png" alt="10"><br><strong>10</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-11.png" alt="11"><br><strong>11</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-12.png" alt="12"><br><strong>12</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-13.png" alt="13"><br><strong>13</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-14.png" alt="14"><br><strong>14</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-15.png" alt="15"><br><strong>15</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-16.png" alt="16"><br><strong>16</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-17.png" alt="17"><br><strong>17</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-18.png" alt="18"><br><strong>18</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-19.png" alt="19"><br><strong>19</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-20.png" alt="20"><br><strong>20</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-21.png" alt="21"><br><strong>21</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-22.png" alt="22"><br><strong>22</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-23.png" alt="23"><br><strong>23</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-24.png" alt="24"><br><strong>24</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-25.png" alt="25"><br><strong>25</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-26.png" alt="26"><br><strong>26</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-27.png" alt="27"><br><strong>27</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-28.png" alt="28"><br><strong>28</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-29.png" alt="29"><br><strong>29</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-30.png" alt="30"><br><strong>30</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-31.png" alt="31"><br><strong>31</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-32.png" alt="32"><br><strong>32</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-33.png" alt="33"><br><strong>33</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-34.png" alt="34"><br><strong>34</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-35.png" alt="35"><br><strong>35</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-36.png" alt="36"><br><strong>36</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-37.png" alt="37"><br><strong>37</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-38.png" alt="38"><br><strong>38</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-39.png" alt="39"><br><strong>39</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-40.png" alt="40"><br><strong>40</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-41.png" alt="41"><br><strong>41</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-42.png" alt="42"><br><strong>42</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-43.png" alt="43"><br><strong>43</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-44.png" alt="44"><br><strong>44</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-45.png" alt="45"><br><strong>45</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-46.png" alt="46"><br><strong>46</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-47.png" alt="47"><br><strong>47</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-48.png" alt="48"><br><strong>48</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-49.png" alt="49"><br><strong>49</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-50.png" alt="50"><br><strong>50</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-51.png" alt="51"><br><strong>51</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-52.png" alt="52"><br><strong>52</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-53.png" alt="53"><br><strong>53</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-54.png" alt="54"><br><strong>54</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-55.png" alt="55"><br><strong>55</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-56.png" alt="56"><br><strong>56</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-57.png" alt="57"><br><strong>57</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-58.png" alt="58"><br><strong>58</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-59.png" alt="59"><br><strong>59</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-60.png" alt="60"><br><strong>60</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-61.png" alt="61"><br><strong>61</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-62.png" alt="62"><br><strong>62</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-63.png" alt="63"><br><strong>63</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-64.png" alt="64"><br><strong>64</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-65.png" alt="65"><br><strong>65</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-66.png" alt="66"><br><strong>66</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-67.png" alt="67"><br><strong>67</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-68.png" alt="68"><br><strong>68</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-69.png" alt="69"><br><strong>69</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-70.png" alt="70"><br><strong>70</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-71.png" alt="71"><br><strong>71</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-72.png" alt="72"><br><strong>72</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-73.png" alt="73"><br><strong>73</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-74.png" alt="74"><br><strong>74</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-75.png" alt="75"><br><strong>75</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-76.png" alt="76"><br><strong>76</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-77.png" alt="77"><br><strong>77</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-78.png" alt="78"><br><strong>78</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-79.png" alt="79"><br><strong>79</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-80.png" alt="80"><br><strong>80</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-81.png" alt="81"><br><strong>81</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-82.png" alt="82"><br><strong>82</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-83.png" alt="83"><br><strong>83</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-84.png" alt="84"><br><strong>84</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-85.png" alt="85"><br><strong>85</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-86.png" alt="86"><br><strong>86</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-87.png" alt="87"><br><strong>87</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-88.png" alt="88"><br><strong>88</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-89.png" alt="89"><br><strong>89</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-90.png" alt="90"><br><strong>90</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-91.png" alt="91"><br><strong>91</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-92.png" alt="92"><br><strong>92</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-93.png" alt="93"><br><strong>93</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-94.png" alt="94"><br><strong>94</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-95.png" alt="95"><br><strong>95</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-96.png" alt="96"><br><strong>96</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-97.png" alt="97"><br><strong>97</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-98.png" alt="98"><br><strong>98</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-99.png" alt="99"><br><strong>99</strong></span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-100.png" alt="100"><br><strong>100</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-101.png" alt="101"><br><strong>101</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-102.png" alt="102"><br><strong>102</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-103.png" alt="103"><br><strong>103</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-104.png" alt="104"><br><strong>104</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-105.png" alt="105"><br><strong>105</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-106.png" alt="106"><br><strong>106</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-107.png" alt="107"><br><strong>107</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-108.png" alt="108"><br><strong>108</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-109.png" alt="109"><br><strong>109</strong><br>Marker ID 20</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-110.png" alt="110"><br><strong>110</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-111.png" alt="111"><br><strong>111</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-112.png" alt="112"><br><strong>112</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-113.png" alt="113"><br><strong>113</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-114.png" alt="114"><br><strong>114</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-115.png" alt="115"><br><strong>115</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-116.png" alt="116"><br><strong>116</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-117.png" alt="117"><br><strong>117</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-118.png" alt="118"><br><strong>118</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-119.png" alt="119"><br><strong>119</strong><br>Marker ID 21</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-120.png" alt="120"><br><strong>120</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-121.png" alt="121"><br><strong>121</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-122.png" alt="122"><br><strong>122</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-123.png" alt="123"><br><strong>123</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-124.png" alt="124"><br><strong>124</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-125.png" alt="125"><br><strong>125</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-126.png" alt="126"><br><strong>126</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-127.png" alt="127"><br><strong>127</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-128.png" alt="128"><br><strong>128</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-129.png" alt="129"><br><strong>129</strong><br>Marker ID 22</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-130.png" alt="130"><br><strong>130</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-131.png" alt="131"><br><strong>131</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-132.png" alt="132"><br><strong>132</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-133.png" alt="133"><br><strong>133</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-134.png" alt="134"><br><strong>134</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-135.png" alt="135"><br><strong>135</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-136.png" alt="136"><br><strong>136</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-137.png" alt="137"><br><strong>137</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-138.png" alt="138"><br><strong>138</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-139.png" alt="139"><br><strong>139</strong><br>Marker ID 23</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-140.png" alt="140"><br><strong>140</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-141.png" alt="141"><br><strong>141</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-142.png" alt="142"><br><strong>142</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-143.png" alt="143"><br><strong>143</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-144.png" alt="144"><br><strong>144</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-145.png" alt="145"><br><strong>145</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-146.png" alt="146"><br><strong>146</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-147.png" alt="147"><br><strong>147</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-148.png" alt="148"><br><strong>148</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-149.png" alt="149"><br><strong>149</strong><br>Marker ID 24</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-150.png" alt="150"><br><strong>150</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-151.png" alt="151"><br><strong>151</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-152.png" alt="152"><br><strong>152</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-153.png" alt="153"><br><strong>153</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-154.png" alt="154"><br><strong>154</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-155.png" alt="155"><br><strong>155</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-156.png" alt="156"><br><strong>156</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-157.png" alt="157"><br><strong>157</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-158.png" alt="158"><br><strong>158</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-159.png" alt="159"><br><strong>159</strong><br>Marker ID 25</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-160.png" alt="160"><br><strong>160</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-161.png" alt="161"><br><strong>161</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-162.png" alt="162"><br><strong>162</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-163.png" alt="163"><br><strong>163</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-164.png" alt="164"><br><strong>164</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-165.png" alt="165"><br><strong>165</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-166.png" alt="166"><br><strong>166</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-167.png" alt="167"><br><strong>167</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-168.png" alt="168"><br><strong>168</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-169.png" alt="169"><br><strong>169</strong><br>Marker ID 26</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-170.png" alt="170"><br><strong>170</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-171.png" alt="171"><br><strong>171</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-172.png" alt="172"><br><strong>172</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-173.png" alt="173"><br><strong>173</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-174.png" alt="174"><br><strong>174</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-175.png" alt="175"><br><strong>175</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-176.png" alt="176"><br><strong>176</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-177.png" alt="177"><br><strong>177</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-178.png" alt="178"><br><strong>178</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-179.png" alt="179"><br><strong>179</strong><br>Marker ID 27</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-180.png" alt="180"><br><strong>180</strong><br>Marker ID 28</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-181.png" alt="181"><br><strong>181</strong><br>Marker ID 28</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-182.png" alt="182"><br><strong>182</strong><br>Marker ID 28</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-183.png" alt="183"><br><strong>183</strong><br>Marker ID 28</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-184.png" alt="184"><br><strong>184</strong><br>Marker ID 28</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-185.png" alt="185"><br><strong>185</strong><br>Marker ID 28</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-186.png" alt="186"><br><strong>186</strong><br>Marker ID 28</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-187.png" alt="187"><br><strong>187</strong><br>Marker ID 28</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-188.png" alt="188"><br><strong>188</strong><br>Marker ID 28</span></div>
<div class="checkpoint"><span><img src="/checkpoints/44-189.png" alt="189"><br><strong>189</strong><br>Marker ID 28</span></div>
</div>