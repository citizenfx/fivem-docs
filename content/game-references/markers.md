---
title: Markers
weight: 705
---

Markers
-----

<!-- _loc1_.map((name, idx) => `<div class="marker"><span><img src="/markers/${name}.png" alt="${name}"> ${idx}<br>${name}</div>`).join('\n') -->

<style text="text/css">
.markers {
    display:grid;
    grid-template-columns: repeat(auto-fill, 25%);
}

.marker {
    padding: 2.5px;
    margin: 2.5px;
    border: 1px solid #333;
    background-color: #fafafa;
    position: relative
}

.marker span {
    display: block;
    text-align: center;
    bottom: 2.5px;
    left: 2.5px;
    right: 2.5px;
    word-wrap: break-word;
}

.marker img {
    max-height: 200px;
}
</style>

<div class="markers">
<div class="marker"><span><img src="/markers/0.png" alt="0"><strong>0</strong><br>MarkerTypeUpsideDownCone</span></div>
<div class="marker"><span><img src="/markers/1.png" alt="1"><strong>1</strong><br>MarkerTypeVerticalCylinder</span></div>
<div class="marker"><span><img src="/markers/2.png" alt="2"><strong>2</strong><br>MarkerTypeThickChevronUp</span></div>
<div class="marker"><span><img src="/markers/3.png" alt="3"><strong>3</strong><br>MarkerTypeThinChevronUp</span></div>
<div class="marker"><span><img src="/markers/4.png" alt="4"><strong>4</strong><br>MarkerTypeCheckeredFlagRect</span></div>
<div class="marker"><span><img src="/markers/5.png" alt="5"><strong>5</strong><br>MarkerTypeCheckeredFlagCircle</span></div>
<div class="marker"><span><img src="/markers/6.png" alt="6"><strong>6</strong><br>MarkerTypeVerticleCircle</span></div>
<div class="marker"><span><img src="/markers/7.png" alt="7"><strong>7</strong><br>MarkerTypePlaneModel</span></div>
<div class="marker"><span><img src="/markers/8.png" alt="8"><strong>8</strong><br>MarkerTypeLostMCTransparent</span></div>
<div class="marker"><span><img src="/markers/9.png" alt="9"><strong>9</strong><br>MarkerTypeLostMC</span></div>
<div class="marker"><span><img src="/markers/10.png" alt="10"><strong>10</strong><br>MarkerTypeNumber0</span></div>
<div class="marker"><span><img src="/markers/11.png" alt="11"><strong>11</strong><br>MarkerTypeNumber1</span></div>
<div class="marker"><span><img src="/markers/12.png" alt="12"><strong>12</strong><br>MarkerTypeNumber2</span></div>
<div class="marker"><span><img src="/markers/13.png" alt="13"><strong>13</strong><br>MarkerTypeNumber3</span></div>
<div class="marker"><span><img src="/markers/14.png" alt="14"><strong>14</strong><br>MarkerTypeNumber4</span></div>
<div class="marker"><span><img src="/markers/15.png" alt="15"><strong>15</strong><br>MarkerTypeNumber5</span></div>
<div class="marker"><span><img src="/markers/16.png" alt="16"><strong>16</strong><br>MarkerTypeNumber6</span></div>
<div class="marker"><span><img src="/markers/17.png" alt="17"><strong>17</strong><br>MarkerTypeNumber7</span></div>
<div class="marker"><span><img src="/markers/18.png" alt="18"><strong>18</strong><br>MarkerTypeNumber8</span></div>
<div class="marker"><span><img src="/markers/19.png" alt="19"><strong>19</strong><br>MarkerTypeNumber9</span></div>
<div class="marker"><span><img src="/markers/20.png" alt="20"><strong>20</strong><br>MarkerTypeChevronUpx1</span></div>
<div class="marker"><span><img src="/markers/21.png" alt="21"><strong>21</strong><br>MarkerTypeChevronUpx2</span></div>
<div class="marker"><span><img src="/markers/22.png" alt="22"><strong>22</strong><br>MarkerTypeChevronUpx3</span></div>
<div class="marker"><span><img src="/markers/23.png" alt="23"><strong>23</strong><br>MarkerTypeHorizontalCircleFat</span></div>
<div class="marker"><span><img src="/markers/24.png" alt="24"><strong>24</strong><br>MarkerTypeReplayIcon</span></div>
<div class="marker"><span><img src="/markers/25.png" alt="25"><strong>25</strong><br>MarkerTypeHorizontalCircleSkinny</span></div>
<div class="marker"><span><img src="/markers/26.png" alt="26"><strong>26</strong><br>MarkerTypeHorizontalCircleSkinny_Arrow</span></div>
<div class="marker"><span><img src="/markers/27.png" alt="27"><strong>27</strong><br>MarkerTypeHorizontalSplitArrowCircle</span></div>
<div class="marker"><span><img src="/markers/28.png" alt="28"><strong>28</strong><br>MarkerTypeDebugSphere</span></div>
<div class="marker"><span><img src="/markers/29.png" alt="29"><strong>29</strong><br>MarkerTypeDollarSign</span></div>
<div class="marker"><span><img src="/markers/30.png" alt="30"><strong>30</strong><br>MarkerTypeHorizontalBars</span></div>
<div class="marker"><span><img src="/markers/31.png" alt="31"><strong>31</strong><br>MarkerTypeWolfHead</span></div>
<div class="marker"><span><img src="/markers/32.png" alt="32"><strong>32</strong><br>MarkerTypeQuestionMark</span></div>
<div class="marker"><span><img src="/markers/33.png" alt="33"><strong>33</strong><br>MarkerTypePlaneSymbol</span></div>
<div class="marker"><span><img src="/markers/34.png" alt="34"><strong>34</strong><br>MarkerTypeHelicopterSymbol</span></div>
<div class="marker"><span><img src="/markers/35.png" alt="35"><strong>35</strong><br>MarkerTypeBoatSymbol</span></div>
<div class="marker"><span><img src="/markers/36.png" alt="36"><strong>36</strong><br>MarkerTypeCarSymbol</span></div>
<div class="marker"><span><img src="/markers/37.png" alt="37"><strong>37</strong><br>MarkerTypeMotorcycleSymbol</span></div>
<div class="marker"><span><img src="/markers/38.png" alt="38"><strong>38</strong><br>MarkerTypeBikeSymbol</span></div>
<div class="marker"><span><img src="/markers/39.png" alt="39"><strong>39</strong><br>MarkerTypeTruckSymbol</span></div>
<div class="marker"><span><img src="/markers/40.png" alt="40"><strong>40</strong><br>MarkerTypeParachuteSymbol</span></div>
<div class="marker"><span><img src="/markers/41.png" alt="41"><strong>41</strong><br>?</span></div>
<div class="marker"><span><img src="/markers/42.png" alt="42"><strong>42</strong><br>MarkerTypeSawbladeSymbol</span></div>
<div class="marker"><span><img src="/markers/43.png" alt="43"><strong>43</strong><br>?</span></div>
</div>