---
title: Weapon models
weight: 770
---

<style>
   * { box-sizing: border-box; }
   body { margin: 0; overflow-x: hidden; }
   .category { margin-bottom: 40px; }
   .category h2 { text-align: left; margin-top: 30px; margin-bottom: 10px; padding-left: 20px; }
   .weapons { display: flex; flex-wrap: wrap; gap: 20px; padding: 20px; }
   .weapon { background: #FFF; color: #000; border: 1px solid #CCC; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); transition: box-shadow 0.3s ease-in-out; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display: flex; flex-direction: column; justify-content: space-between; height: 100%; width: 220px; }
   .weapon img { width: 100%; height: 100px; object-fit: scale-down; display: block; padding: 10px; border-radius: 8px; }
   .weapon-info { padding: 5px 10px; font-size: 0.8em; background: #F7F7F7; border-top: 1px solid #DDD; color: #333; text-align: left; display: flex; flex-direction: column; justify-content: center; align-items: flex-start; flex-grow: 1; }
   .weapon-info span { margin: 2px 0; }
   .weapon-info span:last-child { margin-bottom: 0; }
   .components, .tints { margin-top: 10px; }
</style>

## Shotgun group
<div class="category" id="shotgun">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_COMBATSHOTGUN.png" alt="Combat Shotgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Combat Shotgun</span>
            <span><strong>Hash:</strong> WEAPON_COMBATSHOTGUN</span>
            <span><strong>Model Hash Key:</strong> w_sg_pumpshotgunh4</span>
            <span><strong>Description:</strong> There's only one semi-automatic shotgun with a fire rate that sets the LSFD alarm bells ringing, and you're looking at it.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Default Shells (COMPONENT_COMBATSHOTGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_AUTOSHOTGUN.png" alt="Sweeper Shotgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Sweeper Shotgun</span>
            <span><strong>Hash:</strong> WEAPON_AUTOSHOTGUN</span>
            <span><strong>Model Hash Key:</strong> w_sg_sweeper</span>
            <span><strong>Description:</strong> How many effective tools for riot control can you tuck into your pants? OK, two. But this is the other one. Part of Bikers.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_AUTOSHOTGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PUMPSHOTGUN.png" alt="Pump Shotgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Pump Shotgun</span>
            <span><strong>Hash:</strong> WEAPON_PUMPSHOTGUN</span>
            <span><strong>Model Hash Key:</strong> w_sg_pumpshotgun</span>
            <span><strong>Description:</strong> Standard shotgun ideal for short-range combat. A high-projectile spread makes up for its lower accuracy at long range.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Dildodude Camo (COMPONENT_PUMPSHOTGUN_VARMOD_XM3)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER)</li>
                     <li> (COMPONENT_PUMPSHOTGUN_CLIP_01)</li>
                     <li>Suppressor (COMPONENT_AT_SR_SUPP)</li>
                     <li>Bone Finish (COMPONENT_PUMPSHOTGUN_VARMOD_SECURITY)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_HEAVYSHOTGUN.png" alt="Heavy Shotgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Heavy Shotgun</span>
            <span><strong>Hash:</strong> WEAPON_HEAVYSHOTGUN</span>
            <span><strong>Model Hash Key:</strong> w_sg_heavyshotgun</span>
            <span><strong>Description:</strong> The weapon to reach for when you absolutely need to make a horrible mess of the room. Best used near easy-wipe surfaces only. Part of the Last Team Standing Update.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Default Clip (COMPONENT_HEAVYSHOTGUN_CLIP_01)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Drum Magazine (COMPONENT_HEAVYSHOTGUN_CLIP_03)</li>
                     <li>Extended Clip (COMPONENT_HEAVYSHOTGUN_CLIP_02)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PUMPSHOTGUN_MK2.png" alt="Pump Shotgun Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Pump Shotgun Mk II</span>
            <span><strong>Hash:</strong> WEAPON_PUMPSHOTGUN_MK2</span>
            <span><strong>Model Hash Key:</strong> w_sg_pumpshotgunmk2</span>
            <span><strong>Description:</strong> Only one thing pumps more action than a pump action: watch out, the recoil is almost as deadly as the shot.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Sessanta Nove (COMPONENT_PUMPSHOTGUN_MK2_CAMO_05)</li>
                     <li>Small Scope (COMPONENT_AT_SCOPE_MACRO_MK2)</li>
                     <li>Brushstroke Camo (COMPONENT_PUMPSHOTGUN_MK2_CAMO_02)</li>
                     <li>Woodland Camo (COMPONENT_PUMPSHOTGUN_MK2_CAMO_03)</li>
                     <li>Explosive Slugs (COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE)</li>
                     <li>Medium Scope (COMPONENT_AT_SCOPE_SMALL_MK2)</li>
                     <li>Holographic Sight (COMPONENT_AT_SIGHTS)</li>
                     <li>Patriotic (COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01)</li>
                     <li>Steel Buckshot Shells (COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING)</li>
                     <li>Squared Muzzle Brake (COMPONENT_AT_MUZZLE_08)</li>
                     <li>Boom! (COMPONENT_PUMPSHOTGUN_MK2_CAMO_10)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Dragon's Breath Shells (COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY)</li>
                     <li>Suppressor (COMPONENT_AT_SR_SUPP_03)</li>
                     <li>Default Shells (COMPONENT_PUMPSHOTGUN_MK2_CLIP_01)</li>
                     <li>Zebra (COMPONENT_PUMPSHOTGUN_MK2_CAMO_08)</li>
                     <li>Perseus (COMPONENT_PUMPSHOTGUN_MK2_CAMO_06)</li>
                     <li>Leopard (COMPONENT_PUMPSHOTGUN_MK2_CAMO_07)</li>
                     <li>Digital Camo (COMPONENT_PUMPSHOTGUN_MK2_CAMO)</li>
                     <li>Flechette Shells (COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT)</li>
                     <li>Geometric (COMPONENT_PUMPSHOTGUN_MK2_CAMO_09)</li>
                     <li>Skull (COMPONENT_PUMPSHOTGUN_MK2_CAMO_04)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_SAWNOFFSHOTGUN.png" alt="Sawed-Off Shotgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Sawed-Off Shotgun</span>
            <span><strong>Hash:</strong> WEAPON_SAWNOFFSHOTGUN</span>
            <span><strong>Model Hash Key:</strong> w_sg_sawnoff</span>
            <span><strong>Description:</strong> This single-barrel, sawed-off shotgun compensates for its low range and ammo capacity with devastating efficiency in close combat.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Gilded Gun Metal Finish (COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE)</li>
                     <li> (COMPONENT_SAWNOFFSHOTGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_BULLPUPSHOTGUN.png" alt="Bullpup Shotgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Bullpup Shotgun</span>
            <span><strong>Hash:</strong> WEAPON_BULLPUPSHOTGUN</span>
            <span><strong>Model Hash Key:</strong> w_sg_bullpupshotgun</span>
            <span><strong>Description:</strong> More than makes up for its slow, pump-action rate of fire with its range and spread.  Decimates anything in its projectile path.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                     <li> (COMPONENT_BULLPUPSHOTGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_ASSAULTSHOTGUN.png" alt="Assault Shotgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Assault Shotgun</span>
            <span><strong>Hash:</strong> WEAPON_ASSAULTSHOTGUN</span>
            <span><strong>Model Hash Key:</strong> w_sg_assaultshotgun</span>
            <span><strong>Description:</strong> Fully automatic shotgun with 8 round magazine and high rate of fire.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Extended Clip (COMPONENT_ASSAULTSHOTGUN_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_ASSAULTSHOTGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_DBSHOTGUN.png" alt="Double Barrel Shotgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Double Barrel Shotgun</span>
            <span><strong>Hash:</strong> WEAPON_DBSHOTGUN</span>
            <span><strong>Model Hash Key:</strong> w_sg_doublebarrel</span>
            <span><strong>Description:</strong> Do one thing, do it well. Who needs a high rate of fire when your first shot turns the other guy into a fine mist? Part of Lowriders: Custom Classics.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li> (COMPONENT_DBSHOTGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Default tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## Sniper group
<div class="category" id="sniper">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_SNIPERRIFLE.png" alt="Sniper Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Sniper Rifle</span>
            <span><strong>Hash:</strong> WEAPON_SNIPERRIFLE</span>
            <span><strong>Model Hash Key:</strong> w_sr_sniperrifle</span>
            <span><strong>Description:</strong> Standard sniper rifle. Ideal for situations that require accuracy at long range. Limitations include slow reload speed and very low rate of fire.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Etched Wood Grip Finish (COMPONENT_SNIPERRIFLE_VARMOD_LUXE)</li>
                     <li>Default Clip (COMPONENT_SNIPERRIFLE_CLIP_01)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                     <li>Advanced Scope (COMPONENT_AT_SCOPE_MAX)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_LARGE)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_HEAVYSNIPER_MK2.png" alt="Heavy Sniper Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Heavy Sniper Mk II</span>
            <span><strong>Hash:</strong> WEAPON_HEAVYSNIPER_MK2</span>
            <span><strong>Model Hash Key:</strong> w_sr_heavysnipermk2</span>
            <span><strong>Description:</strong> Far away, yet always intimate: if you're looking for a secure foundation for that long-distance relationship, this is it.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Incendiary Rounds (COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY)</li>
                     <li>Heavy Barrel (COMPONENT_AT_SR_BARREL_02)</li>
                     <li>Skull (COMPONENT_HEAVYSNIPER_MK2_CAMO_04)</li>
                     <li>Sessanta Nove (COMPONENT_HEAVYSNIPER_MK2_CAMO_05)</li>
                     <li>Extended Clip (COMPONENT_HEAVYSNIPER_MK2_CLIP_02)</li>
                     <li>Thermal Scope (COMPONENT_AT_SCOPE_THERMAL)</li>
                     <li>Perseus (COMPONENT_HEAVYSNIPER_MK2_CAMO_06)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ)</li>
                     <li>Squared Muzzle Brake (COMPONENT_AT_MUZZLE_08)</li>
                     <li>Bell-End Muzzle Brake (COMPONENT_AT_MUZZLE_09)</li>
                     <li>Patriotic (COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01)</li>
                     <li>Zoom Scope (COMPONENT_AT_SCOPE_LARGE_MK2)</li>
                     <li>Explosive Rounds (COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE)</li>
                     <li>Default Barrel (COMPONENT_AT_SR_BARREL_01)</li>
                     <li>Boom! (COMPONENT_HEAVYSNIPER_MK2_CAMO_10)</li>
                     <li>Suppressor (COMPONENT_AT_SR_SUPP_03)</li>
                     <li>Leopard (COMPONENT_HEAVYSNIPER_MK2_CAMO_07)</li>
                     <li>Night Vision Scope (COMPONENT_AT_SCOPE_NV)</li>
                     <li>Advanced Scope (COMPONENT_AT_SCOPE_MAX)</li>
                     <li>Zebra (COMPONENT_HEAVYSNIPER_MK2_CAMO_08)</li>
                     <li>Brushstroke Camo (COMPONENT_HEAVYSNIPER_MK2_CAMO_02)</li>
                     <li>Geometric (COMPONENT_HEAVYSNIPER_MK2_CAMO_09)</li>
                     <li>Woodland Camo (COMPONENT_HEAVYSNIPER_MK2_CAMO_03)</li>
                     <li>Digital Camo (COMPONENT_HEAVYSNIPER_MK2_CAMO)</li>
                     <li>Armor Piercing Rounds (COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING)</li>
                     <li>Default Clip (COMPONENT_HEAVYSNIPER_MK2_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_HEAVYSNIPER.png" alt="Heavy Sniper">
         <div class="weapon-info">
            <span><strong>Name:</strong> Heavy Sniper</span>
            <span><strong>Hash:</strong> WEAPON_HEAVYSNIPER</span>
            <span><strong>Model Hash Key:</strong> w_sr_heavysniper</span>
            <span><strong>Description:</strong> Features armor-piercing rounds for heavy damage. Comes with laser scope as standard.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_HEAVYSNIPER_CLIP_01)</li>
                     <li>Advanced Scope (COMPONENT_AT_SCOPE_MAX)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_LARGE)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MARKSMANRIFLE_MK2.png" alt="Marksman Rifle Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Marksman Rifle Mk II</span>
            <span><strong>Hash:</strong> WEAPON_MARKSMANRIFLE_MK2</span>
            <span><strong>Model Hash Key:</strong> w_sr_marksmanriflemk2</span>
            <span><strong>Description:</strong> Known in military circles as The Dislocator, this mod set will destroy both the target and your shoulder, in that order.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Heavy Duty Muzzle Brake (COMPONENT_AT_MUZZLE_05)</li>
                     <li>Leopard (COMPONENT_MARKSMANRIFLE_MK2_CAMO_07)</li>
                     <li>Perseus (COMPONENT_MARKSMANRIFLE_MK2_CAMO_06)</li>
                     <li>Slanted Muzzle Brake (COMPONENT_AT_MUZZLE_06)</li>
                     <li>Default Barrel (COMPONENT_AT_MRFL_BARREL_01)</li>
                     <li>Boom! (COMPONENT_MARKSMANRIFLE_MK2_CAMO_10)</li>
                     <li>Holographic Sight (COMPONENT_AT_SIGHTS)</li>
                     <li>Split-End Muzzle Brake (COMPONENT_AT_MUZZLE_07)</li>
                     <li>Zoom Scope (COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2)</li>
                     <li>Woodland Camo (COMPONENT_MARKSMANRIFLE_MK2_CAMO_03)</li>
                     <li>Heavy Barrel (COMPONENT_AT_MRFL_BARREL_02)</li>
                     <li>Incendiary Rounds (COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY)</li>
                     <li>Brushstroke Camo (COMPONENT_MARKSMANRIFLE_MK2_CAMO_02)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Digital Camo (COMPONENT_MARKSMANRIFLE_MK2_CAMO)</li>
                     <li>Default Clip (COMPONENT_MARKSMANRIFLE_MK2_CLIP_01)</li>
                     <li>Geometric (COMPONENT_MARKSMANRIFLE_MK2_CAMO_09)</li>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP_02)</li>
                     <li>Boom! (COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01)</li>
                     <li>Flat Muzzle Brake (COMPONENT_AT_MUZZLE_01)</li>
                     <li>Zebra (COMPONENT_MARKSMANRIFLE_MK2_CAMO_08)</li>
                     <li>Large Scope (COMPONENT_AT_SCOPE_MEDIUM_MK2)</li>
                     <li>Tactical Muzzle Brake (COMPONENT_AT_MUZZLE_02)</li>
                     <li>Tracer Rounds (COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER)</li>
                     <li>Fat-End Muzzle Brake (COMPONENT_AT_MUZZLE_03)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ)</li>
                     <li>Extended Clip (COMPONENT_MARKSMANRIFLE_MK2_CLIP_02)</li>
                     <li>Precision Muzzle Brake (COMPONENT_AT_MUZZLE_04)</li>
                     <li>Sessanta Nove (COMPONENT_MARKSMANRIFLE_MK2_CAMO_05)</li>
                     <li>Armor Piercing Rounds (COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING)</li>
                     <li>Skull (COMPONENT_MARKSMANRIFLE_MK2_CAMO_04)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PRECISIONRIFLE.png" alt="Precision Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Precision Rifle</span>
            <span><strong>Hash:</strong> WEAPON_PRECISIONRIFLE</span>
            <span><strong>Model Hash Key:</strong> W_SR_PrecisionRifle_REH</span>
            <span><strong>Description:</strong> A rifle for perfectionists. Because why settle for right-between-the-eyes, when you could have right-through-the-superior-frontal-gyrus?</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_PRECISIONRIFLE_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MUSKET.png" alt="Musket">
         <div class="weapon-info">
            <span><strong>Name:</strong> Musket</span>
            <span><strong>Hash:</strong> WEAPON_MUSKET</span>
            <span><strong>Model Hash Key:</strong> w_ar_musket</span>
            <span><strong>Description:</strong> Armed with nothing but muskets and a superiority complex, the Brits took over half the world. Own the gun that built an empire. Part of the Independence Day Special.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_MUSKET_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Default tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MARKSMANRIFLE.png" alt="Marksman Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Marksman Rifle</span>
            <span><strong>Hash:</strong> WEAPON_MARKSMANRIFLE</span>
            <span><strong>Model Hash Key:</strong> w_sr_marksmanrifle</span>
            <span><strong>Description:</strong> Whether you're up close or a disconcertingly long way away, this weapon will get the job done. A multi-range tool for tools. Part of the Last Team Standing Update.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_MARKSMANRIFLE_VARMOD_LUXE)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Extended Clip (COMPONENT_MARKSMANRIFLE_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_MARKSMANRIFLE_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## Fire extinguisher group
<div class="category" id="fire-extinguisher">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_FIREEXTINGUISHER.png" alt="Fire Extinguisher">
         <div class="weapon-info">
            <span><strong>Name:</strong> Fire Extinguisher</span>
            <span><strong>Hash:</strong> WEAPON_FIREEXTINGUISHER</span>
            <span><strong>Model Hash Key:</strong> w_am_fire_exting</span>
            <div class="components"></div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## Heavy group
<div class="category" id="heavy">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_COMPACTLAUNCHER.png" alt="Compact Grenade Launcher">
         <div class="weapon-info">
            <span><strong>Name:</strong> Compact Grenade Launcher</span>
            <span><strong>Hash:</strong> WEAPON_COMPACTLAUNCHER</span>
            <span><strong>Model Hash Key:</strong> w_lr_compactgl</span>
            <span><strong>Description:</strong> Focus groups using the regular model suggested it was too accurate and found it awkward to use with one hand on the throttle. Easy fix. Part of Bikers.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_COMPACTLAUNCHER_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MINIGUN.png" alt="Minigun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Minigun</span>
            <span><strong>Hash:</strong> WEAPON_MINIGUN</span>
            <span><strong>Model Hash Key:</strong> w_mg_minigun</span>
            <span><strong>Description:</strong> A devastating 6-barrel machine gun that features Gatling-style rotating barrels. Very high rate of fire (2000 to 6000 rounds per minute).</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li> (COMPONENT_MINIGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_GRENADELAUNCHER_SMOKE.png" alt="Tear Gas Launcher">
         <div class="weapon-info">
            <span><strong>Name:</strong> Tear Gas Launcher</span>
            <span><strong>Hash:</strong> WEAPON_GRENADELAUNCHER_SMOKE</span>
            <span><strong>Model Hash Key:</strong> w_lr_grenadelauncher</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_SMALL)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_HOMINGLAUNCHER.png" alt="Homing Launcher">
         <div class="weapon-info">
            <span><strong>Name:</strong> Homing Launcher</span>
            <span><strong>Hash:</strong> WEAPON_HOMINGLAUNCHER</span>
            <span><strong>Model Hash Key:</strong> w_lr_homing</span>
            <span><strong>Description:</strong> Infrared guided fire-and-forget missile launcher. For all your moving target needs. Part of the Festive Surprise.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li> (COMPONENT_HOMINGLAUNCHER_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_RAILGUN.png" alt="Railgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Railgun</span>
            <span><strong>Hash:</strong> WEAPON_RAILGUN</span>
            <span><strong>Model Hash Key:</strong> w_ar_railgun</span>
            <span><strong>Description:</strong> All you need to know is - magnets, and it does horrible things to the things it's pointed at. Exclusive content for returning players.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_RAILGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_FIREWORK.png" alt="Firework Launcher">
         <div class="weapon-info">
            <span><strong>Name:</strong> Firework Launcher</span>
            <span><strong>Hash:</strong> WEAPON_FIREWORK</span>
            <span><strong>Model Hash Key:</strong> w_lr_firework</span>
            <span><strong>Description:</strong> Put the flair back in flare with this firework launcher, guaranteed to raise some oohs and aahs from the crowd. Part of the Independence Day Special.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_FIREWORK_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Default tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_GRENADELAUNCHER.png" alt="Grenade Launcher">
         <div class="weapon-info">
            <span><strong>Name:</strong> Grenade Launcher</span>
            <span><strong>Hash:</strong> WEAPON_GRENADELAUNCHER</span>
            <span><strong>Model Hash Key:</strong> w_lr_grenadelauncher</span>
            <span><strong>Description:</strong> A compact, lightweight grenade launcher with semi-automatic functionality. Holds up to 10 rounds.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li> (COMPONENT_GRENADELAUNCHER_CLIP_01)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_SMALL)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_RPG.png" alt="RPG">
         <div class="weapon-info">
            <span><strong>Name:</strong> RPG</span>
            <span><strong>Hash:</strong> WEAPON_RPG</span>
            <span><strong>Model Hash Key:</strong> w_lr_rpg</span>
            <span><strong>Description:</strong> A portable, shoulder-launched, anti-tank weapon that fires explosive warheads. Very effective for taking down vehicles or large groups of assailants.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li> (COMPONENT_RPG_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_RAYMINIGUN.png" alt="Widowmaker">
         <div class="weapon-info">
            <span><strong>Name:</strong> Widowmaker</span>
            <span><strong>Hash:</strong> WEAPON_RAYMINIGUN</span>
            <span><strong>Model Hash Key:</strong> w_mg_sminigun</span>
            <span><strong>Description:</strong> Republican Space Ranger Special. GO AHEAD, SAY I'M COMPENSATING FOR SOMETHING. I DARE YOU.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li> (COMPONENT_MINIGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Space Ranger tint</li>
                     <li>Purple tint</li>
                     <li>Green tint</li>
                     <li>Orange tint</li>
                     <li>Pink tint</li>
                     <li>Gold tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_EMPLAUNCHER.png" alt="Compact EMP Launcher">
         <div class="weapon-info">
            <span><strong>Name:</strong> Compact EMP Launcher</span>
            <span><strong>Hash:</strong> WEAPON_EMPLAUNCHER</span>
            <span><strong>Model Hash Key:</strong> w_lr_compactml</span>
            <span><strong>Description:</strong> Ever seen a confetti cannon? The Compact EMP Launcher is just like that, but instead of paper and happiness, it's an electromagnetic pulse, short circuits and shattered dreams.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_EMPLAUNCHER_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_RAILGUNXM3.png" alt="Railgun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Railgun</span>
            <span><strong>Hash:</strong> WEAPON_RAILGUNXM3</span>
            <span><strong>Model Hash Key:</strong> W_AR_RailGun_XM3</span>
            <span><strong>Description:</strong> All you need to know is — magnets, and it does horrible things to the things it's pointed at.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_RAILGUNXM3_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## Thrown group
<div class="category" id="thrown">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_SNOWBALL.png" alt="Snowball">
         <div class="weapon-info">
            <span><strong>Name:</strong> Snowball</span>
            <span><strong>Hash:</strong> WEAPON_SNOWBALL</span>
            <span><strong>Model Hash Key:</strong> w_ex_snowball</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_BALL.png" alt="Ball">
         <div class="weapon-info">
            <span><strong>Name:</strong> Ball</span>
            <span><strong>Hash:</strong> WEAPON_BALL</span>
            <span><strong>Model Hash Key:</strong> w_am_baseball</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MOLOTOV.png" alt="Molotov">
         <div class="weapon-info">
            <span><strong>Name:</strong> Molotov</span>
            <span><strong>Hash:</strong> WEAPON_MOLOTOV</span>
            <span><strong>Model Hash Key:</strong> w_ex_molotov</span>
            <span><strong>Description:</strong> Crude yet highly effective incendiary weapon. No happy hour with this cocktail.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_STICKYBOMB.png" alt="Sticky Bomb">
         <div class="weapon-info">
            <span><strong>Name:</strong> Sticky Bomb</span>
            <span><strong>Hash:</strong> WEAPON_STICKYBOMB</span>
            <span><strong>Model Hash Key:</strong> w_ex_pe</span>
            <span><strong>Description:</strong> A plastic explosive charge fitted with a remote detonator. Can be thrown and then detonated or attached to a vehicle then detonated.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_FLARE.png" alt="Flare">
         <div class="weapon-info">
            <span><strong>Name:</strong> Flare</span>
            <span><strong>Hash:</strong> WEAPON_FLARE</span>
            <span><strong>Model Hash Key:</strong> w_am_flare</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_GRENADE.png" alt="Grenade">
         <div class="weapon-info">
            <span><strong>Name:</strong> Grenade</span>
            <span><strong>Hash:</strong> WEAPON_GRENADE</span>
            <span><strong>Model Hash Key:</strong> w_ex_grenadefrag</span>
            <span><strong>Description:</strong> Standard fragmentation grenade. Pull pin, throw, then find cover. Ideal for eliminating clustered assailants.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_BZGAS.png" alt="BZ Gas">
         <div class="weapon-info">
            <span><strong>Name:</strong> BZ Gas</span>
            <span><strong>Hash:</strong> WEAPON_BZGAS</span>
            <span><strong>Model Hash Key:</strong> w_ex_grenadesmoke</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PROXMINE.png" alt="Proximity Mine">
         <div class="weapon-info">
            <span><strong>Name:</strong> Proximity Mine</span>
            <span><strong>Hash:</strong> WEAPON_PROXMINE</span>
            <span><strong>Model Hash Key:</strong> w_ex_apmine</span>
            <span><strong>Description:</strong> Leave a present for your friends with these motion sensor landmines. Short delay after activation. Part of the Festive Surprise.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PIPEBOMB.png" alt="Pipe Bomb">
         <div class="weapon-info">
            <span><strong>Name:</strong> Pipe Bomb</span>
            <span><strong>Hash:</strong> WEAPON_PIPEBOMB</span>
            <span><strong>Model Hash Key:</strong> w_ex_pipebomb</span>
            <span><strong>Description:</strong> Remember, it doesn't count as an IED when you buy it in a store and use it in a first world country. Part of Bikers.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_ACIDPACKAGE.png" alt="Acid Package">
         <div class="weapon-info">
            <span><strong>Name:</strong> Acid Package</span>
            <span><strong>Hash:</strong> WEAPON_ACIDPACKAGE</span>
            <span><strong>Model Hash Key:</strong> W_AM_Papers_XM3</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_SMOKEGRENADE.png" alt="Tear Gas">
         <div class="weapon-info">
            <span><strong>Name:</strong> Tear Gas</span>
            <span><strong>Hash:</strong> WEAPON_SMOKEGRENADE</span>
            <span><strong>Model Hash Key:</strong> w_ex_grenadesmoke</span>
            <span><strong>Description:</strong> Tear gas grenade, particularly effective at incapacitating multiple assailants. Sustained exposure can be lethal.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
   </div>
</div>

## Pistol group
<div class="category" id="pistol">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_VINTAGEPISTOL.png" alt="Vintage Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> Vintage Pistol</span>
            <span><strong>Hash:</strong> WEAPON_VINTAGEPISTOL</span>
            <span><strong>Model Hash Key:</strong> w_pi_vintage_pistol</span>
            <span><strong>Description:</strong> What you really need is a more recognizable gun. Stand out from the crowd at an armed robbery with this engraved pistol. Part of The "I'm Not a Hipster" Update.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Extended Clip (COMPONENT_VINTAGEPISTOL_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_VINTAGEPISTOL_CLIP_01)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PISTOL.png" alt="Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> Pistol</span>
            <span><strong>Hash:</strong> WEAPON_PISTOL</span>
            <span><strong>Model Hash Key:</strong> W_PI_PISTOL</span>
            <span><strong>Description:</strong> Standard handgun. A .45 caliber pistol with a magazine capacity of 12 rounds that can be extended to 16.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Flashlight (COMPONENT_AT_PI_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP_02)</li>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_PISTOL_VARMOD_LUXE)</li>
                     <li>Extended Clip (COMPONENT_PISTOL_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_PISTOL_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PISTOLXM3.png" alt="WM 29 Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> WM 29 Pistol</span>
            <span><strong>Hash:</strong> WEAPON_PISTOLXM3</span>
            <span><strong>Model Hash Key:</strong> W_PI_Pistol_XM3</span>
            <span><strong>Description:</strong> If you think shooting off without lifting a finger is a problem, there's a pill for that. But if you think it's a plus, there's the semi-automatic WM 29 Pistol.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_PISTOLXM3_CLIP_01)</li>
                     <li>Suppressor (COMPONENT_PISTOLXM3_SUPP)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_APPISTOL.png" alt="AP Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> AP Pistol</span>
            <span><strong>Hash:</strong> WEAPON_APPISTOL</span>
            <span><strong>Model Hash Key:</strong> W_PI_APPISTOL</span>
            <span><strong>Description:</strong> High-penetration, fully-automatic pistol. Holds 18 rounds in magazine with option to extend to 36 rounds.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Extended Clip (COMPONENT_APPISTOL_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_APPISTOL_CLIP_01)</li>
                     <li>Flashlight (COMPONENT_AT_PI_FLSH)</li>
                     <li>Record A Finish (COMPONENT_APPISTOL_VARMOD_SECURITY)</li>
                     <li>Gilded Gun Metal Finish (COMPONENT_APPISTOL_VARMOD_LUXE)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_CERAMICPISTOL.png" alt="Ceramic Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> Ceramic Pistol</span>
            <span><strong>Hash:</strong> WEAPON_CERAMICPISTOL</span>
            <span><strong>Model Hash Key:</strong> w_pi_ceramic_pistol</span>
            <span><strong>Description:</strong> Not your grandma's ceramics. Although this pint-sized pistol is small enough to fit into her purse and won't set off a metal detector.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_CERAMICPISTOL_CLIP_01)</li>
                     <li>Extended Clip (COMPONENT_CERAMICPISTOL_CLIP_02)</li>
                     <li>Suppressor (COMPONENT_CERAMICPISTOL_SUPP)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_FLAREGUN.png" alt="Flare Gun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Flare Gun</span>
            <span><strong>Hash:</strong> WEAPON_FLAREGUN</span>
            <span><strong>Model Hash Key:</strong> w_pi_flaregun</span>
            <span><strong>Description:</strong> Use to signal distress or drunken excitement. Warning: pointing directly at individuals may cause spontaneous combustion. Part of The Heists Update.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li> (COMPONENT_FLAREGUN_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Default tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_GADGETPISTOL.png" alt="Perico Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> Perico Pistol</span>
            <span><strong>Hash:</strong> WEAPON_GADGETPISTOL</span>
            <span><strong>Model Hash Key:</strong> w_pi_singleshoth4</span>
            <span><strong>Description:</strong> A deadly shot. Don't be precious. You won't scuff the titanium nitride finish.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_GADGETPISTOL_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_COMBATPISTOL.png" alt="Combat Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> Combat Pistol</span>
            <span><strong>Hash:</strong> WEAPON_COMBATPISTOL</span>
            <span><strong>Model Hash Key:</strong> W_PI_COMBATPISTOL</span>
            <span><strong>Description:</strong> A compact, lightweight, semi-automatic pistol designed for law enforcement and personal defense. 12-round magazine with option to extend to 16 rounds.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_COMBATPISTOL_CLIP_01)</li>
                     <li>Flashlight (COMPONENT_AT_PI_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP)</li>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER)</li>
                     <li>Extended Clip (COMPONENT_COMBATPISTOL_CLIP_02)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_SNSPISTOL_MK2.png" alt="SNS Pistol Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> SNS Pistol Mk II</span>
            <span><strong>Hash:</strong> WEAPON_SNSPISTOL_MK2</span>
            <span><strong>Model Hash Key:</strong> w_pi_sns_pistolmk2</span>
            <span><strong>Description:</strong> The ultimate purse-filler: if you want to make Saturday Night really special, this is your ticket.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_SNSPISTOL_MK2_CLIP_01)</li>
                     <li>Geometric (COMPONENT_SNSPISTOL_MK2_CAMO_09)</li>
                     <li>Digital Camo (COMPONENT_SNSPISTOL_MK2_CAMO)</li>
                     <li>Patriotic (COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE)</li>
                     <li>Geometric (COMPONENT_SNSPISTOL_MK2_CAMO_09_SLIDE)</li>
                     <li>Boom! (COMPONENT_SNSPISTOL_MK2_CAMO_10)</li>
                     <li>Brushstroke Camo (COMPONENT_SNSPISTOL_MK2_CAMO_02_SLIDE)</li>
                     <li>Zebra (COMPONENT_SNSPISTOL_MK2_CAMO_08_SLIDE)</li>
                     <li>Woodland Camo (COMPONENT_SNSPISTOL_MK2_CAMO_03_SLIDE)</li>
                     <li>Leopard (COMPONENT_SNSPISTOL_MK2_CAMO_07)</li>
                     <li>Boom! (COMPONENT_SNSPISTOL_MK2_CAMO_IND_01)</li>
                     <li>Mounted Scope (COMPONENT_AT_PI_RAIL_02)</li>
                     <li>Flashlight (COMPONENT_AT_PI_FLSH_03)</li>
                     <li>Perseus (COMPONENT_SNSPISTOL_MK2_CAMO_06)</li>
                     <li>Zebra (COMPONENT_SNSPISTOL_MK2_CAMO_08)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP_02)</li>
                     <li>Woodland Camo (COMPONENT_SNSPISTOL_MK2_CAMO_03)</li>
                     <li>Brushstroke Camo (COMPONENT_SNSPISTOL_MK2_CAMO_02)</li>
                     <li>Boom! (COMPONENT_SNSPISTOL_MK2_CAMO_10_SLIDE)</li>
                     <li>Hollow Point Rounds (COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT)</li>
                     <li>Tracer Rounds (COMPONENT_SNSPISTOL_MK2_CLIP_TRACER)</li>
                     <li>Sessanta Nove (COMPONENT_SNSPISTOL_MK2_CAMO_05)</li>
                     <li>Skull (COMPONENT_SNSPISTOL_MK2_CAMO_04)</li>
                     <li>Compensator (COMPONENT_AT_PI_COMP_02)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_SNSPISTOL_MK2_CLIP_FMJ)</li>
                     <li>Sessanta Nove (COMPONENT_SNSPISTOL_MK2_CAMO_05_SLIDE)</li>
                     <li>Extended Clip (COMPONENT_SNSPISTOL_MK2_CLIP_02)</li>
                     <li>Leopard (COMPONENT_SNSPISTOL_MK2_CAMO_07_SLIDE)</li>
                     <li>Skull (COMPONENT_SNSPISTOL_MK2_CAMO_04_SLIDE)</li>
                     <li>Incendiary Rounds (COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY)</li>
                     <li>Digital Camo (COMPONENT_SNSPISTOL_MK2_CAMO_SLIDE)</li>
                     <li>Perseus (COMPONENT_SNSPISTOL_MK2_CAMO_06_SLIDE)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_NAVYREVOLVER.png" alt="Navy Revolver">
         <div class="weapon-info">
            <span><strong>Name:</strong> Navy Revolver</span>
            <span><strong>Hash:</strong> WEAPON_NAVYREVOLVER</span>
            <span><strong>Model Hash Key:</strong> w_pi_wep2_gun</span>
            <span><strong>Description:</strong> A true museum piece. You want to know how the West was won - slow reload speeds and a whole heap of bloodshed.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_NAVYREVOLVER_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Default tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_DOUBLEACTION.png" alt="Double-Action Revolver">
         <div class="weapon-info">
            <span><strong>Name:</strong> Double-Action Revolver</span>
            <span><strong>Hash:</strong> WEAPON_DOUBLEACTION</span>
            <span><strong>Model Hash Key:</strong> w_pi_wep1_gun</span>
            <span><strong>Description:</strong> Because sometimes revenge is a dish best served six times, in quick succession, right between the eyes. Part of The Doomsday Heist.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_DOUBLEACTION_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PISTOL50.png" alt="Pistol .50">
         <div class="weapon-info">
            <span><strong>Name:</strong> Pistol .50</span>
            <span><strong>Hash:</strong> WEAPON_PISTOL50</span>
            <span><strong>Model Hash Key:</strong> W_PI_PISTOL50</span>
            <span><strong>Description:</strong> High-impact pistol that delivers immense power but with extremely strong recoil. Holds 9 rounds in magazine.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_PISTOL50_CLIP_01)</li>
                     <li>Flashlight (COMPONENT_AT_PI_FLSH)</li>
                     <li>Platinum Pearl Deluxe Finish (COMPONENT_PISTOL50_VARMOD_LUXE)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                     <li>Extended Clip (COMPONENT_PISTOL50_CLIP_02)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_RAYPISTOL.png" alt="Up-n-Atomizer">
         <div class="weapon-info">
            <span><strong>Name:</strong> Up-n-Atomizer</span>
            <span><strong>Hash:</strong> WEAPON_RAYPISTOL</span>
            <span><strong>Model Hash Key:</strong> w_pi_raygun</span>
            <span><strong>Description:</strong> Republican Space Ranger Special, fresh from the galactic war on socialism: no ammo, no mag, just one brutal energy pulse after another.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Festive tint (COMPONENT_RAYPISTOL_VARMOD_XMAS18)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Blue tint</li>
                     <li>Purple tint</li>
                     <li>Green tint</li>
                     <li>Orange tint</li>
                     <li>Pink tint</li>
                     <li>Gold tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_SNSPISTOL.png" alt="SNS Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> SNS Pistol</span>
            <span><strong>Hash:</strong> WEAPON_SNSPISTOL</span>
            <span><strong>Model Hash Key:</strong> w_pi_sns_pistol</span>
            <span><strong>Description:</strong> Like condoms or hairspray, this fits in your pocket for a night out in a Vinewood club. It's half as accurate as a champagne cork but twice as deadly. Part of the Beach Bum Pack.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Extended Clip (COMPONENT_SNSPISTOL_CLIP_02)</li>
                     <li>Etched Wood Grip Finish (COMPONENT_SNSPISTOL_VARMOD_LOWRIDER)</li>
                     <li>Default Clip (COMPONENT_SNSPISTOL_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PISTOL_MK2.png" alt="Pistol Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Pistol Mk II</span>
            <span><strong>Hash:</strong> WEAPON_PISTOL_MK2</span>
            <span><strong>Model Hash Key:</strong> w_pi_pistolmk2</span>
            <span><strong>Description:</strong> Balance, simplicity, precision: nothing keeps the peace like an extended barrel in the other guy's mouth.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Skull (COMPONENT_PISTOL_MK2_CAMO_04)</li>
                     <li>Brushstroke Camo (COMPONENT_PISTOL_MK2_CAMO_02)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_02_SLIDE)</li>
                     <li>Compensator (COMPONENT_AT_PI_COMP)</li>
                     <li>Tracer Rounds (COMPONENT_PISTOL_MK2_CLIP_TRACER)</li>
                     <li>Incendiary Rounds (COMPONENT_PISTOL_MK2_CLIP_INCENDIARY)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_04_SLIDE)</li>
                     <li>Season's Greetings (COMPONENT_PISTOL_MK2_VARMOD_XM3_SLIDE)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_10_SLIDE)</li>
                     <li>Flashlight (COMPONENT_AT_PI_FLSH_02)</li>
                     <li>Season's Greetings (COMPONENT_PISTOL_MK2_VARMOD_XM3)</li>
                     <li>Patriotic (COMPONENT_PISTOL_MK2_CAMO_IND_01_SLIDE)</li>
                     <li>Zebra (COMPONENT_PISTOL_MK2_CAMO_08)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_PISTOL_MK2_CLIP_FMJ)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO)</li>
                     <li>Extended Clip (COMPONENT_PISTOL_MK2_CLIP_02)</li>
                     <li>Geometric (COMPONENT_PISTOL_MK2_CAMO_09)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP_02)</li>
                     <li>Boom! (COMPONENT_PISTOL_MK2_CAMO_10)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_06_SLIDE)</li>
                     <li>Hollow Point Rounds (COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT)</li>
                     <li>Mounted Scope (COMPONENT_AT_PI_RAIL)</li>
                     <li>Patriotic (COMPONENT_PISTOL_MK2_CAMO_IND_01)</li>
                     <li>Default Clip (COMPONENT_PISTOL_MK2_CLIP_01)</li>
                     <li>Woodland Camo (COMPONENT_PISTOL_MK2_CAMO_03)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_07_SLIDE)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_08_SLIDE)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_SLIDE)</li>
                     <li>Leopard (COMPONENT_PISTOL_MK2_CAMO_07)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_09_SLIDE)</li>
                     <li>Perseus (COMPONENT_PISTOL_MK2_CAMO_06)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_05_SLIDE)</li>
                     <li>Digital Camo (COMPONENT_PISTOL_MK2_CAMO_03_SLIDE)</li>
                     <li>Sessanta Nove (COMPONENT_PISTOL_MK2_CAMO_05)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_REVOLVER.png" alt="Heavy Revolver">
         <div class="weapon-info">
            <span><strong>Name:</strong> Heavy Revolver</span>
            <span><strong>Hash:</strong> WEAPON_REVOLVER</span>
            <span><strong>Model Hash Key:</strong> w_pi_revolver</span>
            <span><strong>Description:</strong> A handgun with enough stopping power to drop a crazed rhino, and heavy enough to beat it to death if you're out of ammo. Part of Executives and Other Criminals.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>VIP Variant (COMPONENT_REVOLVER_VARMOD_BOSS)</li>
                     <li>Bodyguard Variant (COMPONENT_REVOLVER_VARMOD_GOON)</li>
                     <li>Default Clip (COMPONENT_REVOLVER_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_REVOLVER_MK2.png" alt="Heavy Revolver Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Heavy Revolver Mk II</span>
            <span><strong>Hash:</strong> WEAPON_REVOLVER_MK2</span>
            <span><strong>Model Hash Key:</strong> w_pi_revolvermk2</span>
            <span><strong>Description:</strong> If you can lift it, this is the closest you'll get to shooting someone with a freight train.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Brushstroke Camo (COMPONENT_REVOLVER_MK2_CAMO_02)</li>
                     <li>Incendiary Rounds (COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY)</li>
                     <li>Small Scope (COMPONENT_AT_SCOPE_MACRO_MK2)</li>
                     <li>Woodland Camo (COMPONENT_REVOLVER_MK2_CAMO_03)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_REVOLVER_MK2_CLIP_FMJ)</li>
                     <li>Hollow Point Rounds (COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT)</li>
                     <li>Sessanta Nove (COMPONENT_REVOLVER_MK2_CAMO_05)</li>
                     <li>Perseus (COMPONENT_REVOLVER_MK2_CAMO_06)</li>
                     <li>Boom! (COMPONENT_REVOLVER_MK2_CAMO_10)</li>
                     <li>Leopard (COMPONENT_REVOLVER_MK2_CAMO_07)</li>
                     <li>Compensator (COMPONENT_AT_PI_COMP_03)</li>
                     <li>Flashlight (COMPONENT_AT_PI_FLSH)</li>
                     <li>Zebra (COMPONENT_REVOLVER_MK2_CAMO_08)</li>
                     <li>Holographic Sight (COMPONENT_AT_SIGHTS)</li>
                     <li>Geometric (COMPONENT_REVOLVER_MK2_CAMO_09)</li>
                     <li>Default Rounds (COMPONENT_REVOLVER_MK2_CLIP_01)</li>
                     <li>Digital Camo (COMPONENT_REVOLVER_MK2_CAMO)</li>
                     <li>Tracer Rounds (COMPONENT_REVOLVER_MK2_CLIP_TRACER)</li>
                     <li>Patriotic (COMPONENT_REVOLVER_MK2_CAMO_IND_01)</li>
                     <li>Skull (COMPONENT_REVOLVER_MK2_CAMO_04)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_HEAVYPISTOL.png" alt="Heavy Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> Heavy Pistol</span>
            <span><strong>Hash:</strong> WEAPON_HEAVYPISTOL</span>
            <span><strong>Model Hash Key:</strong> w_pi_heavypistol</span>
            <span><strong>Description:</strong> The heavyweight champion of the magazine fed, semi-automatic handgun world. Delivers a serious forearm workout every time. Part of The Business Update.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_HEAVYPISTOL_CLIP_01)</li>
                     <li>Flashlight (COMPONENT_AT_PI_FLSH)</li>
                     <li>Extended Clip (COMPONENT_HEAVYPISTOL_CLIP_02)</li>
                     <li>Etched Wood Grip Finish (COMPONENT_HEAVYPISTOL_VARMOD_LUXE)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MARKSMANPISTOL.png" alt="Marksman Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> Marksman Pistol</span>
            <span><strong>Hash:</strong> WEAPON_MARKSMANPISTOL</span>
            <span><strong>Model Hash Key:</strong> W_PI_SingleShot</span>
            <span><strong>Description:</strong> Not for the risk averse. Make it count as you'll be reloading as much as you shoot. Part of The Ill-Gotten Gains Update Part 2.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_MARKSMANPISTOL_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Default tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## SMG group
<div class="category" id="smg">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_COMBATPDW.png" alt="Combat PDW">
         <div class="weapon-info">
            <span><strong>Name:</strong> Combat PDW</span>
            <span><strong>Hash:</strong> WEAPON_COMBATPDW</span>
            <span><strong>Model Hash Key:</strong> W_SB_PDW</span>
            <span><strong>Description:</strong> Who said personal weaponry couldn't be worthy of military personnel? Thanks to our lobbyists, not Congress. Integral suppressor. Part of the Ill-Gotten Gains Update Part 1.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Extended Clip (COMPONENT_COMBATPDW_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_COMBATPDW_CLIP_01)</li>
                     <li>Drum Magazine (COMPONENT_COMBATPDW_CLIP_03)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_SMALL)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MICROSMG.png" alt="Micro SMG">
         <div class="weapon-info">
            <span><strong>Name:</strong> Micro SMG</span>
            <span><strong>Hash:</strong> WEAPON_MICROSMG</span>
            <span><strong>Model Hash Key:</strong> w_sb_microsmg</span>
            <span><strong>Description:</strong> Combines compact design with a high rate of fire at approximately 700-900 rounds per minute.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Extended Clip (COMPONENT_MICROSMG_CLIP_02)</li>
                     <li>Flashlight (COMPONENT_AT_PI_FLSH)</li>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_MICROSMG_VARMOD_LUXE)</li>
                     <li>Organics Finish (COMPONENT_MICROSMG_VARMOD_SECURITY)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_MACRO)</li>
                     <li>Dildodude Camo (COMPONENT_MICROSMG_VARMOD_XM3)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                     <li>Default Clip (COMPONENT_MICROSMG_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_SMG.png" alt="SMG">
         <div class="weapon-info">
            <span><strong>Name:</strong> SMG</span>
            <span><strong>Hash:</strong> WEAPON_SMG</span>
            <span><strong>Model Hash Key:</strong> w_sb_smg</span>
            <span><strong>Description:</strong> This is known as a good all-round submachine gun. Lightweight with an accurate sight and 30-round magazine capacity.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_SMG_CLIP_01)</li>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_SMG_VARMOD_LUXE)</li>
                     <li>Extended Clip (COMPONENT_SMG_CLIP_02)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_MACRO_02)</li>
                     <li>Drum Magazine (COMPONENT_SMG_CLIP_03)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_SMG_MK2.png" alt="SMG Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> SMG Mk II</span>
            <span><strong>Hash:</strong> WEAPON_SMG_MK2</span>
            <span><strong>Model Hash Key:</strong> w_sb_smgmk2</span>
            <span><strong>Description:</strong> Lightweight, compact, with a rate of fire to die very messily for: turn any confined space into a kill box at the click of a well-oiled trigger.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Heavy Duty Muzzle Brake (COMPONENT_AT_MUZZLE_05)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_SMG_MK2_CLIP_FMJ)</li>
                     <li>Geometric (COMPONENT_SMG_MK2_CAMO_09)</li>
                     <li>Leopard (COMPONENT_SMG_MK2_CAMO_07)</li>
                     <li>Slanted Muzzle Brake (COMPONENT_AT_MUZZLE_06)</li>
                     <li>Perseus (COMPONENT_SMG_MK2_CAMO_06)</li>
                     <li>Brushstroke Camo (COMPONENT_SMG_MK2_CAMO_02)</li>
                     <li>Patriotic (COMPONENT_SMG_MK2_CAMO_IND_01)</li>
                     <li>Hollow Point Rounds (COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT)</li>
                     <li>Medium Scope (COMPONENT_AT_SCOPE_SMALL_SMG_MK2)</li>
                     <li>Boom! (COMPONENT_SMG_MK2_CAMO_10)</li>
                     <li>Sessanta Nove (COMPONENT_SMG_MK2_CAMO_05)</li>
                     <li>Woodland Camo (COMPONENT_SMG_MK2_CAMO_03)</li>
                     <li>Default Clip (COMPONENT_SMG_MK2_CLIP_01)</li>
                     <li>Split-End Muzzle Brake (COMPONENT_AT_MUZZLE_07)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Tracer Rounds (COMPONENT_SMG_MK2_CLIP_TRACER)</li>
                     <li>Holographic Sight (COMPONENT_AT_SIGHTS_SMG)</li>
                     <li>Zebra (COMPONENT_SMG_MK2_CAMO_08)</li>
                     <li>Heavy Barrel (COMPONENT_AT_SB_BARREL_02)</li>
                     <li>Extended Clip (COMPONENT_SMG_MK2_CLIP_02)</li>
                     <li>Flat Muzzle Brake (COMPONENT_AT_MUZZLE_01)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP)</li>
                     <li>Digital Camo (COMPONENT_SMG_MK2_CAMO)</li>
                     <li>Tactical Muzzle Brake (COMPONENT_AT_MUZZLE_02)</li>
                     <li>Default Barrel (COMPONENT_AT_SB_BARREL_01)</li>
                     <li>Incendiary Rounds (COMPONENT_SMG_MK2_CLIP_INCENDIARY)</li>
                     <li>Fat-End Muzzle Brake (COMPONENT_AT_MUZZLE_03)</li>
                     <li>Small Scope (COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2)</li>
                     <li>Skull (COMPONENT_SMG_MK2_CAMO_04)</li>
                     <li>Precision Muzzle Brake (COMPONENT_AT_MUZZLE_04)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MINISMG.png" alt="Mini SMG">
         <div class="weapon-info">
            <span><strong>Name:</strong> Mini SMG</span>
            <span><strong>Hash:</strong> WEAPON_MINISMG</span>
            <span><strong>Model Hash Key:</strong> w_sb_minismg</span>
            <span><strong>Description:</strong> Increasingly popular since the marketing team looked beyond spec ops units and started caring about the little guys in low income areas. Part of Bikers.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_MINISMG_CLIP_01)</li>
                     <li>Extended Clip (COMPONENT_MINISMG_CLIP_02)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MACHINEPISTOL.png" alt="Machine Pistol">
         <div class="weapon-info">
            <span><strong>Name:</strong> Machine Pistol</span>
            <span><strong>Hash:</strong> WEAPON_MACHINEPISTOL</span>
            <span><strong>Model Hash Key:</strong> w_sb_compactsmg</span>
            <span><strong>Description:</strong> This fully automatic is the snare drum to your twin-engine V8 bass: no drive-by sounds quite right without it. Part of Lowriders.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_MACHINEPISTOL_CLIP_01)</li>
                     <li>Drum Magazine (COMPONENT_MACHINEPISTOL_CLIP_03)</li>
                     <li>Extended Clip (COMPONENT_MACHINEPISTOL_CLIP_02)</li>
                     <li>Suppressor (COMPONENT_AT_PI_SUPP)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_ASSAULTSMG.png" alt="Assault SMG">
         <div class="weapon-info">
            <span><strong>Name:</strong> Assault SMG</span>
            <span><strong>Hash:</strong> WEAPON_ASSAULTSMG</span>
            <span><strong>Model Hash Key:</strong> w_sb_assaultsmg</span>
            <span><strong>Description:</strong> A high-capacity submachine gun that is both compact and lightweight. Holds up to 30 bullets in one magazine.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Default Clip (COMPONENT_ASSAULTSMG_CLIP_01)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_MACRO)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                     <li>Extended Clip (COMPONENT_ASSAULTSMG_CLIP_02)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## Petrol can group
<div class="category" id="petrol-can">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_FERTILIZERCAN.png" alt="Fertilizer Can">
         <div class="weapon-info">
            <span><strong>Name:</strong> Fertilizer Can</span>
            <span><strong>Hash:</strong> WEAPON_FERTILIZERCAN</span>
            <span><strong>Model Hash Key:</strong> W_AM_Jerrycan_SF</span>
            <div class="components"></div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_PETROLCAN.png" alt="Jerry Can">
         <div class="weapon-info">
            <span><strong>Name:</strong> Jerry Can</span>
            <span><strong>Hash:</strong> WEAPON_PETROLCAN</span>
            <span><strong>Model Hash Key:</strong> w_am_jerrycan</span>
            <span><strong>Description:</strong> Leaves a trail of gasoline that can be ignited.</span>
            <div class="components"></div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_HAZARDCAN.png" alt="Hazardous Jerry Can">
         <div class="weapon-info">
            <span><strong>Name:</strong> Hazardous Jerry Can</span>
            <span><strong>Hash:</strong> WEAPON_HAZARDCAN</span>
            <span><strong>Model Hash Key:</strong> w_ch_jerrycan</span>
            <div class="components"></div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## Melee group
<div class="category" id="melee">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_WRENCH.png" alt="Pipe Wrench">
         <div class="weapon-info">
            <span><strong>Name:</strong> Pipe Wrench</span>
            <span><strong>Hash:</strong> WEAPON_WRENCH</span>
            <span><strong>Model Hash Key:</strong> w_me_wrench</span>
            <span><strong>Description:</strong> Perennial favourite of apocalyptic survivalists and violent fathers the world over, apparently it also doubles as some kind of tool. Part of Bikers.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_STONE_HATCHET.png" alt="Stone Hatchet">
         <div class="weapon-info">
            <span><strong>Name:</strong> Stone Hatchet</span>
            <span><strong>Hash:</strong> WEAPON_STONE_HATCHET</span>
            <span><strong>Model Hash Key:</strong> w_me_stonehatchet</span>
            <span><strong>Description:</strong> There's retro, there's vintage, and there's this. After 500 years of technological development and spiritual apocalypse, pre-Colombian chic is back.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_GOLFCLUB.png" alt="Golf Club">
         <div class="weapon-info">
            <span><strong>Name:</strong> Golf Club</span>
            <span><strong>Hash:</strong> WEAPON_GOLFCLUB</span>
            <span><strong>Model Hash Key:</strong> w_me_gclub</span>
            <span><strong>Description:</strong> Standard length, mid iron golf club with rubber grip for a lethal short game.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_HAMMER.png" alt="Hammer">
         <div class="weapon-info">
            <span><strong>Name:</strong> Hammer</span>
            <span><strong>Hash:</strong> WEAPON_HAMMER</span>
            <span><strong>Model Hash Key:</strong> w_me_hammer</span>
            <span><strong>Description:</strong> A robust, multi-purpose hammer with wooden handle and curved claw, this old classic still nails the competition.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_CANDYCANE.png" alt="Candy Cane">
         <div class="weapon-info">
            <span><strong>Name:</strong> Candy Cane</span>
            <span><strong>Hash:</strong> WEAPON_CANDYCANE</span>
            <span><strong>Model Hash Key:</strong> W_ME_Candy_XM3</span>
            <span><strong>Description:</strong> This year, why not go one step further? Add to the onslaught of music, lights, and merriment by literally beating your peers to death with the festive spirit.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_NIGHTSTICK.png" alt="Nightstick">
         <div class="weapon-info">
            <span><strong>Name:</strong> Nightstick</span>
            <span><strong>Hash:</strong> WEAPON_NIGHTSTICK</span>
            <span><strong>Model Hash Key:</strong> w_me_nightstick</span>
            <span><strong>Description:</strong> 24" polycarbonate side-handled nightstick.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_CROWBAR.png" alt="Crowbar">
         <div class="weapon-info">
            <span><strong>Name:</strong> Crowbar</span>
            <span><strong>Hash:</strong> WEAPON_CROWBAR</span>
            <span><strong>Model Hash Key:</strong> w_me_crowbar</span>
            <span><strong>Description:</strong> Heavy-duty crowbar forged from high quality, tempered steel for that extra leverage you need to get the job done.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_FLASHLIGHT.png" alt="Flashlight">
         <div class="weapon-info">
            <span><strong>Name:</strong> Flashlight</span>
            <span><strong>Hash:</strong> WEAPON_FLASHLIGHT</span>
            <span><strong>Model Hash Key:</strong> w_me_flashlight</span>
            <span><strong>Description:</strong> Intensify your fear of the dark with this short range, battery-powered light source. Handy for blunt force trauma. Part of The Halloween Surprise.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Flashlight (COMPONENT_FLASHLIGHT_LIGHT)</li>
                  </ul>
               </details>
            </div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_DAGGER.png" alt="Antique Cavalry Dagger">
         <div class="weapon-info">
            <span><strong>Name:</strong> Antique Cavalry Dagger</span>
            <span><strong>Hash:</strong> WEAPON_DAGGER</span>
            <span><strong>Model Hash Key:</strong> w_me_dagger</span>
            <span><strong>Description:</strong> You've been rocking the pirate-chic look for a while, but no vicious weapon to complete the look? Get this dagger with guarded hilt. Part of The "I'm Not a Hipster" Update.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_POOLCUE.png" alt="Pool Cue">
         <div class="weapon-info">
            <span><strong>Name:</strong> Pool Cue</span>
            <span><strong>Hash:</strong> WEAPON_POOLCUE</span>
            <span><strong>Model Hash Key:</strong> w_me_poolcue</span>
            <span><strong>Description:</strong> Ah, there's no sound as satisfying as the crack of a perfect break, especially when it's the other guy's spine. Part of Bikers.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_BAT.png" alt="Baseball Bat">
         <div class="weapon-info">
            <span><strong>Name:</strong> Baseball Bat</span>
            <span><strong>Hash:</strong> WEAPON_BAT</span>
            <span><strong>Model Hash Key:</strong> w_me_bat</span>
            <span><strong>Description:</strong> Aluminum baseball bat with leather grip. Lightweight yet powerful for all you big hitters out there.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Trippy (COMPONENT_BAT_VARMOD_XM3_07)</li>
                     <li>Spatter (COMPONENT_BAT_VARMOD_XM3_01)</li>
                     <li>Blagueurs (COMPONENT_BAT_VARMOD_XM3)</li>
                     <li>Bullet Holes (COMPONENT_BAT_VARMOD_XM3_02)</li>
                     <li>Burger Shot (COMPONENT_BAT_VARMOD_XM3_03)</li>
                     <li>Wall (COMPONENT_BAT_VARMOD_XM3_09)</li>
                     <li>Tie-Dye (COMPONENT_BAT_VARMOD_XM3_08)</li>
                     <li>Cluckin' Bell (COMPONENT_BAT_VARMOD_XM3_04)</li>
                     <li>Fatal Incursion (COMPONENT_BAT_VARMOD_XM3_05)</li>
                     <li>Lucha Libre (COMPONENT_BAT_VARMOD_XM3_06)</li>
                  </ul>
               </details>
            </div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_KNIFE.png" alt="Knife">
         <div class="weapon-info">
            <span><strong>Name:</strong> Knife</span>
            <span><strong>Hash:</strong> WEAPON_KNIFE</span>
            <span><strong>Model Hash Key:</strong> w_me_knife_01</span>
            <span><strong>Description:</strong> This carbon steel 7" bladed knife is dual edged with a serrated spine to provide improved stabbing and thrusting capabilities.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Eyes (COMPONENT_KNIFE_VARMOD_XM3)</li>
                     <li>Spatter (COMPONENT_KNIFE_VARMOD_XM3_01)</li>
                     <li>Lightning (COMPONENT_KNIFE_VARMOD_XM3_03)</li>
                     <li>Flames (COMPONENT_KNIFE_VARMOD_XM3_02)</li>
                     <li>Trippy (COMPONENT_KNIFE_VARMOD_XM3_07)</li>
                     <li>Lucha Libre (COMPONENT_KNIFE_VARMOD_XM3_06)</li>
                     <li>Pills (COMPONENT_KNIFE_VARMOD_XM3_04)</li>
                     <li>Snakeskin (COMPONENT_KNIFE_VARMOD_XM3_05)</li>
                     <li>Tequilya (COMPONENT_KNIFE_VARMOD_XM3_08)</li>
                     <li>Orang-O-Tang (COMPONENT_KNIFE_VARMOD_XM3_09)</li>
                  </ul>
               </details>
            </div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_BATTLEAXE.png" alt="Battle Axe">
         <div class="weapon-info">
            <span><strong>Name:</strong> Battle Axe</span>
            <span><strong>Hash:</strong> WEAPON_BATTLEAXE</span>
            <span><strong>Model Hash Key:</strong> w_me_battleaxe</span>
            <span><strong>Description:</strong> If it's good enough for medieval foot soldiers, modern border guards and pushy soccer moms, it's good enough for you. Part of Bikers.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MACHETE.png" alt="Machete">
         <div class="weapon-info">
            <span><strong>Name:</strong> Machete</span>
            <span><strong>Hash:</strong> WEAPON_MACHETE</span>
            <span><strong>Model Hash Key:</strong> w_me_machette_lr</span>
            <span><strong>Description:</strong> America's West African arms trade isn't just about giving. Rediscover the simple life with this rusty cleaver. Part of Lowriders.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_SWITCHBLADE.png" alt="Switchblade">
         <div class="weapon-info">
            <span><strong>Name:</strong> Switchblade</span>
            <span><strong>Hash:</strong> WEAPON_SWITCHBLADE</span>
            <span><strong>Model Hash Key:</strong> w_me_switchblade</span>
            <span><strong>Description:</strong> From your pocket to hilt-deep in the other guy's ribs in under a second: folding knives will never go out of style. Part of Executives and Other Criminals.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>VIP Variant (COMPONENT_SWITCHBLADE_VARMOD_VAR1)</li>
                     <li>Default Handle (COMPONENT_SWITCHBLADE_VARMOD_BASE)</li>
                     <li>Bodyguard Variant (COMPONENT_SWITCHBLADE_VARMOD_VAR2)</li>
                  </ul>
               </details>
            </div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_HATCHET.png" alt="Hatchet">
         <div class="weapon-info">
            <span><strong>Name:</strong> Hatchet</span>
            <span><strong>Hash:</strong> WEAPON_HATCHET</span>
            <span><strong>Model Hash Key:</strong> w_me_hatchet</span>
            <span><strong>Description:</strong> Make kindling... of your pals with this easy to wield, easy to hide hatchet. Exclusive content for returning players.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_BOTTLE.png" alt="Bottle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Bottle</span>
            <span><strong>Hash:</strong> WEAPON_BOTTLE</span>
            <span><strong>Model Hash Key:</strong> w_me_bottle</span>
            <span><strong>Description:</strong> It's not clever and it's not pretty but, most of the time, neither is the guy coming at you with a knife. When all else fails, this gets the job done. Part of the Beach Bum Pack.</span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
   </div>
</div>

## Stun gun group
<div class="category" id="stun-gun">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_STUNGUN.png" alt="Stun Gun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Stun Gun</span>
            <span><strong>Hash:</strong> WEAPON_STUNGUN</span>
            <span><strong>Model Hash Key:</strong> w_pi_stungun</span>
            <span><strong>Description:</strong> Fires a projectile that administers a voltage capable of temporarily stunning an assailant. Takes approximately 4 seconds to recharge after firing.</span>
            <div class="components"></div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_STUNGUN_MP.png" alt="Stun Gun">
         <div class="weapon-info">
            <span><strong>Name:</strong> Stun Gun</span>
            <span><strong>Hash:</strong> WEAPON_STUNGUN_MP</span>
            <span><strong>Model Hash Key:</strong> w_pi_stungun</span>
            <span><strong>Description:</strong> It's, like, literally stunning.</span>
            <div class="components"></div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## Rifle group
<div class="category" id="rifle">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_ASSAULTRIFLE_MK2.png" alt="Assault Rifle Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Assault Rifle Mk II</span>
            <span><strong>Hash:</strong> WEAPON_ASSAULTRIFLE_MK2</span>
            <span><strong>Model Hash Key:</strong> w_ar_assaultriflemk2</span>
            <span><strong>Description:</strong> The definitive revision of an all-time classic: all it takes is a little work, and looks can kill after all.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Heavy Duty Muzzle Brake (COMPONENT_AT_MUZZLE_05)</li>
                     <li>Small Scope (COMPONENT_AT_SCOPE_MACRO_MK2)</li>
                     <li>Skull (COMPONENT_ASSAULTRIFLE_MK2_CAMO_04)</li>
                     <li>Slanted Muzzle Brake (COMPONENT_AT_MUZZLE_06)</li>
                     <li>Brushstroke Camo (COMPONENT_ASSAULTRIFLE_MK2_CAMO_02)</li>
                     <li>Holographic Sight (COMPONENT_AT_SIGHTS)</li>
                     <li>Default Barrel (COMPONENT_AT_AR_BARREL_01)</li>
                     <li>Split-End Muzzle Brake (COMPONENT_AT_MUZZLE_07)</li>
                     <li>Woodland Camo (COMPONENT_ASSAULTRIFLE_MK2_CAMO_03)</li>
                     <li>Heavy Barrel (COMPONENT_AT_AR_BARREL_02)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Geometric (COMPONENT_ASSAULTRIFLE_MK2_CAMO_09)</li>
                     <li>Default Clip (COMPONENT_ASSAULTRIFLE_MK2_CLIP_01)</li>
                     <li>Digital Camo (COMPONENT_ASSAULTRIFLE_MK2_CAMO)</li>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP_02)</li>
                     <li>Boom! (COMPONENT_ASSAULTRIFLE_MK2_CAMO_10)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                     <li>Armor Piercing Rounds (COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING)</li>
                     <li>Leopard (COMPONENT_ASSAULTRIFLE_MK2_CAMO_07)</li>
                     <li>Flat Muzzle Brake (COMPONENT_AT_MUZZLE_01)</li>
                     <li>Patriotic (COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01)</li>
                     <li>Sessanta Nove (COMPONENT_ASSAULTRIFLE_MK2_CAMO_05)</li>
                     <li>Large Scope (COMPONENT_AT_SCOPE_MEDIUM_MK2)</li>
                     <li>Tactical Muzzle Brake (COMPONENT_AT_MUZZLE_02)</li>
                     <li>Perseus (COMPONENT_ASSAULTRIFLE_MK2_CAMO_06)</li>
                     <li>Extended Clip (COMPONENT_ASSAULTRIFLE_MK2_CLIP_02)</li>
                     <li>Fat-End Muzzle Brake (COMPONENT_AT_MUZZLE_03)</li>
                     <li>Precision Muzzle Brake (COMPONENT_AT_MUZZLE_04)</li>
                     <li>Tracer Rounds (COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER)</li>
                     <li>Incendiary Rounds (COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY)</li>
                     <li>Zebra (COMPONENT_ASSAULTRIFLE_MK2_CAMO_08)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_COMPACTRIFLE.png" alt="Compact Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Compact Rifle</span>
            <span><strong>Hash:</strong> WEAPON_COMPACTRIFLE</span>
            <span><strong>Model Hash Key:</strong> w_ar_assaultrifle_smg</span>
            <span><strong>Description:</strong> Half the size, all the power, double the recoil: there's no riskier way to say "I'm compensating for something". Part of Lowriders: Custom Classics.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_COMPACTRIFLE_CLIP_01)</li>
                     <li>Extended Clip (COMPONENT_COMPACTRIFLE_CLIP_02)</li>
                     <li>Drum Magazine (COMPONENT_COMPACTRIFLE_CLIP_03)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_BULLPUPRIFLE.png" alt="Bullpup Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Bullpup Rifle</span>
            <span><strong>Hash:</strong> WEAPON_BULLPUPRIFLE</span>
            <span><strong>Model Hash Key:</strong> w_ar_bullpuprifle</span>
            <span><strong>Description:</strong> The latest Chinese import taking America by storm, this rifle is known for its balanced handling. Lightweight and very controllable in automatic fire. Part of The High Life Update.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Gilded Gun Metal Finish (COMPONENT_BULLPUPRIFLE_VARMOD_LOW)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_SMALL)</li>
                     <li>Extended Clip (COMPONENT_BULLPUPRIFLE_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_BULLPUPRIFLE_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_CARBINERIFLE.png" alt="Carbine Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Carbine Rifle</span>
            <span><strong>Hash:</strong> WEAPON_CARBINERIFLE</span>
            <span><strong>Model Hash Key:</strong> W_AR_CARBINERIFLE</span>
            <span><strong>Description:</strong> Combining long distance accuracy with a high-capacity magazine, the carbine rifle can be relied on to make the hit.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li> (COMPONENT_AT_RAILCOVER_01)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Extended Clip (COMPONENT_CARBINERIFLE_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_CARBINERIFLE_CLIP_01)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_MEDIUM)</li>
                     <li>Box Magazine (COMPONENT_CARBINERIFLE_CLIP_03)</li>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_CARBINERIFLE_VARMOD_LUXE)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_BULLPUPRIFLE_MK2.png" alt="Bullpup Rifle Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Bullpup Rifle Mk II</span>
            <span><strong>Hash:</strong> WEAPON_BULLPUPRIFLE_MK2</span>
            <span><strong>Model Hash Key:</strong> w_ar_bullpupriflemk2</span>
            <span><strong>Description:</strong> So precise, so exquisite, it's not so much a hail of bullets as a symphony.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_BULLPUPRIFLE_MK2_CLIP_01)</li>
                     <li>Perseus (COMPONENT_BULLPUPRIFLE_MK2_CAMO_06)</li>
                     <li>Heavy Duty Muzzle Brake (COMPONENT_AT_MUZZLE_05)</li>
                     <li>Slanted Muzzle Brake (COMPONENT_AT_MUZZLE_06)</li>
                     <li>Heavy Barrel (COMPONENT_AT_BP_BARREL_02)</li>
                     <li>Medium Scope (COMPONENT_AT_SCOPE_SMALL_MK2)</li>
                     <li>Holographic Sight (COMPONENT_AT_SIGHTS)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ)</li>
                     <li>Split-End Muzzle Brake (COMPONENT_AT_MUZZLE_07)</li>
                     <li>Default Barrel (COMPONENT_AT_BP_BARREL_01)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Tracer Rounds (COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Sessanta Nove (COMPONENT_BULLPUPRIFLE_MK2_CAMO_05)</li>
                     <li>Skull (COMPONENT_BULLPUPRIFLE_MK2_CAMO_04)</li>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP_02)</li>
                     <li>Woodland Camo (COMPONENT_BULLPUPRIFLE_MK2_CAMO_03)</li>
                     <li>Boom! (COMPONENT_BULLPUPRIFLE_MK2_CAMO_10)</li>
                     <li>Incendiary Rounds (COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY)</li>
                     <li>Digital Camo (COMPONENT_BULLPUPRIFLE_MK2_CAMO)</li>
                     <li>Brushstroke Camo (COMPONENT_BULLPUPRIFLE_MK2_CAMO_02)</li>
                     <li>Flat Muzzle Brake (COMPONENT_AT_MUZZLE_01)</li>
                     <li>Patriotic (COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01)</li>
                     <li>Small Scope (COMPONENT_AT_SCOPE_MACRO_02_MK2)</li>
                     <li>Tactical Muzzle Brake (COMPONENT_AT_MUZZLE_02)</li>
                     <li>Geometric (COMPONENT_BULLPUPRIFLE_MK2_CAMO_09)</li>
                     <li>Zebra (COMPONENT_BULLPUPRIFLE_MK2_CAMO_08)</li>
                     <li>Fat-End Muzzle Brake (COMPONENT_AT_MUZZLE_03)</li>
                     <li>Precision Muzzle Brake (COMPONENT_AT_MUZZLE_04)</li>
                     <li>Extended Clip (COMPONENT_BULLPUPRIFLE_MK2_CLIP_02)</li>
                     <li>Leopard (COMPONENT_BULLPUPRIFLE_MK2_CAMO_07)</li>
                     <li>Armor Piercing Rounds (COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_SPECIALCARBINE_MK2.png" alt="Special Carbine Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Special Carbine Mk II</span>
            <span><strong>Hash:</strong> WEAPON_SPECIALCARBINE_MK2</span>
            <span><strong>Model Hash Key:</strong> w_ar_specialcarbinemk2</span>
            <span><strong>Description:</strong> The jack of all trades just got a serious upgrade: bow to the master.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Heavy Duty Muzzle Brake (COMPONENT_AT_MUZZLE_05)</li>
                     <li>Small Scope (COMPONENT_AT_SCOPE_MACRO_MK2)</li>
                     <li>Leopard (COMPONENT_SPECIALCARBINE_MK2_CAMO_07)</li>
                     <li>Default Clip (COMPONENT_SPECIALCARBINE_MK2_CLIP_01)</li>
                     <li>Slanted Muzzle Brake (COMPONENT_AT_MUZZLE_06)</li>
                     <li>Woodland Camo (COMPONENT_SPECIALCARBINE_MK2_CAMO_03)</li>
                     <li>Holographic Sight (COMPONENT_AT_SIGHTS)</li>
                     <li>Brushstroke Camo (COMPONENT_SPECIALCARBINE_MK2_CAMO_02)</li>
                     <li>Split-End Muzzle Brake (COMPONENT_AT_MUZZLE_07)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ)</li>
                     <li>Armor Piercing Rounds (COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING)</li>
                     <li>Patriotic (COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01)</li>
                     <li>Geometric (COMPONENT_SPECIALCARBINE_MK2_CAMO_09)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Tracer Rounds (COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER)</li>
                     <li>Boom! (COMPONENT_SPECIALCARBINE_MK2_CAMO_10)</li>
                     <li>Zebra (COMPONENT_SPECIALCARBINE_MK2_CAMO_08)</li>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP_02)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                     <li>Skull (COMPONENT_SPECIALCARBINE_MK2_CAMO_04)</li>
                     <li>Flat Muzzle Brake (COMPONENT_AT_MUZZLE_01)</li>
                     <li>Large Scope (COMPONENT_AT_SCOPE_MEDIUM_MK2)</li>
                     <li>Tactical Muzzle Brake (COMPONENT_AT_MUZZLE_02)</li>
                     <li>Digital Camo (COMPONENT_SPECIALCARBINE_MK2_CAMO)</li>
                     <li>Incendiary Rounds (COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY)</li>
                     <li>Fat-End Muzzle Brake (COMPONENT_AT_MUZZLE_03)</li>
                     <li>Extended Clip (COMPONENT_SPECIALCARBINE_MK2_CLIP_02)</li>
                     <li>Perseus (COMPONENT_SPECIALCARBINE_MK2_CAMO_06)</li>
                     <li>Default Barrel (COMPONENT_AT_SC_BARREL_01)</li>
                     <li>Precision Muzzle Brake (COMPONENT_AT_MUZZLE_04)</li>
                     <li>Sessanta Nove (COMPONENT_SPECIALCARBINE_MK2_CAMO_05)</li>
                     <li>Heavy Barrel (COMPONENT_AT_SC_BARREL_02)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MILITARYRIFLE.png" alt="Military Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Military Rifle</span>
            <span><strong>Hash:</strong> WEAPON_MILITARYRIFLE</span>
            <span><strong>Model Hash Key:</strong> w_ar_bullpuprifleh4</span>
            <span><strong>Description:</strong> This immensely powerful assault rifle was designed for highly qualified, exceptionally skilled soldiers. Yes, you can buy it.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_MILITARYRIFLE_CLIP_01)</li>
                     <li>Extended Clip (COMPONENT_MILITARYRIFLE_CLIP_02)</li>
                     <li>Iron Sights (COMPONENT_MILITARYRIFLE_SIGHT_01)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_SMALL)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_ADVANCEDRIFLE.png" alt="Advanced Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Advanced Rifle</span>
            <span><strong>Hash:</strong> WEAPON_ADVANCEDRIFLE</span>
            <span><strong>Model Hash Key:</strong> W_AR_ADVANCEDRIFLE</span>
            <span><strong>Description:</strong> The most lightweight and compact of all assault rifles, without compromising accuracy and rate of fire.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Gilded Gun Metal Finish (COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Extended Clip (COMPONENT_ADVANCEDRIFLE_CLIP_02)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_SMALL)</li>
                     <li>Default Clip (COMPONENT_ADVANCEDRIFLE_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_ASSAULTRIFLE.png" alt="Assault Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Assault Rifle</span>
            <span><strong>Hash:</strong> WEAPON_ASSAULTRIFLE</span>
            <span><strong>Model Hash Key:</strong> W_AR_ASSAULTRIFLE</span>
            <span><strong>Description:</strong> This standard assault rifle boasts a large capacity magazine and long distance accuracy.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_ASSAULTRIFLE_VARMOD_LUXE)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_MACRO)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                     <li>Extended Clip (COMPONENT_ASSAULTRIFLE_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_ASSAULTRIFLE_CLIP_01)</li>
                     <li>Drum Magazine (COMPONENT_ASSAULTRIFLE_CLIP_03)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_SPECIALCARBINE.png" alt="Special Carbine">
         <div class="weapon-info">
            <span><strong>Name:</strong> Special Carbine</span>
            <span><strong>Hash:</strong> WEAPON_SPECIALCARBINE</span>
            <span><strong>Model Hash Key:</strong> w_ar_specialcarbine</span>
            <span><strong>Description:</strong> Combining accuracy, maneuverability and low recoil, this is an extremely versatile assault rifle for any combat situation. Part of The Business Update.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Drum Magazine (COMPONENT_SPECIALCARBINE_CLIP_03)</li>
                     <li>Etched Gun Metal Finish (COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Extended Clip (COMPONENT_SPECIALCARBINE_CLIP_02)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_MEDIUM)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                     <li>Default Clip (COMPONENT_SPECIALCARBINE_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_HEAVYRIFLE.png" alt="Heavy Rifle">
         <div class="weapon-info">
            <span><strong>Name:</strong> Heavy Rifle</span>
            <span><strong>Hash:</strong> WEAPON_HEAVYRIFLE</span>
            <span><strong>Model Hash Key:</strong> w_ar_heavyrifleh</span>
            <span><strong>Description:</strong> The no-holds-barred 30-round answer to that eternal question, how do I get this guy off my back?</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Default Clip (COMPONENT_HEAVYRIFLE_CLIP_01)</li>
                     <li>Extended Clip (COMPONENT_HEAVYRIFLE_CLIP_02)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_MEDIUM)</li>
                     <li>Iron Sights (COMPONENT_HEAVYRIFLE_SIGHT_01)</li>
                     <li>Families Finish (COMPONENT_HEAVYRIFLE_CAMO1)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_TACTICALRIFLE.png" alt="Service Carbine">
         <div class="weapon-info">
            <span><strong>Name:</strong> Service Carbine</span>
            <span><strong>Hash:</strong> WEAPON_TACTICALRIFLE</span>
            <span><strong>Model Hash Key:</strong> W_AR_CARBINERIFLE_REH</span>
            <span><strong>Description:</strong> This season's must-have hardware for law enforcement, military personnel and anyone locked in a fight to the death with either law enforcement or military personnel.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Default Clip (COMPONENT_TACTICALRIFLE_CLIP_01)</li>
                     <li>Extended Clip (COMPONENT_TACTICALRIFLE_CLIP_02)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH_REH)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP_02)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_CARBINERIFLE_MK2.png" alt="Carbine Rifle Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Carbine Rifle Mk II</span>
            <span><strong>Hash:</strong> WEAPON_CARBINERIFLE_MK2</span>
            <span><strong>Model Hash Key:</strong> w_ar_carbineriflemk2</span>
            <span><strong>Description:</strong> This is bespoke, artisan firepower: you couldn't deliver a hail of bullets with more love and care if you inserted them by hand.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Heavy Duty Muzzle Brake (COMPONENT_AT_MUZZLE_05)</li>
                     <li>Small Scope (COMPONENT_AT_SCOPE_MACRO_MK2)</li>
                     <li>Tracer Rounds (COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER)</li>
                     <li>Armor Piercing Rounds (COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING)</li>
                     <li>Woodland Camo (COMPONENT_CARBINERIFLE_MK2_CAMO_03)</li>
                     <li>Slanted Muzzle Brake (COMPONENT_AT_MUZZLE_06)</li>
                     <li>Incendiary Rounds (COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY)</li>
                     <li>Brushstroke Camo (COMPONENT_CARBINERIFLE_MK2_CAMO_02)</li>
                     <li>Holographic Sight (COMPONENT_AT_SIGHTS)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ)</li>
                     <li>Digital Camo (COMPONENT_CARBINERIFLE_MK2_CAMO)</li>
                     <li>Default Clip (COMPONENT_CARBINERIFLE_MK2_CLIP_01)</li>
                     <li>Split-End Muzzle Brake (COMPONENT_AT_MUZZLE_07)</li>
                     <li>Extended Clip (COMPONENT_CARBINERIFLE_MK2_CLIP_02)</li>
                     <li>Boom! (COMPONENT_CARBINERIFLE_MK2_CAMO_10)</li>
                     <li>Flashlight (COMPONENT_AT_AR_FLSH)</li>
                     <li>Default Barrel (COMPONENT_AT_CR_BARREL_01)</li>
                     <li>Suppressor (COMPONENT_AT_AR_SUPP)</li>
                     <li>Perseus (COMPONENT_CARBINERIFLE_MK2_CAMO_06)</li>
                     <li>Heavy Barrel (COMPONENT_AT_CR_BARREL_02)</li>
                     <li>Geometric (COMPONENT_CARBINERIFLE_MK2_CAMO_09)</li>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP_02)</li>
                     <li>Zebra (COMPONENT_CARBINERIFLE_MK2_CAMO_08)</li>
                     <li>Flat Muzzle Brake (COMPONENT_AT_MUZZLE_01)</li>
                     <li>Large Scope (COMPONENT_AT_SCOPE_MEDIUM_MK2)</li>
                     <li>Tactical Muzzle Brake (COMPONENT_AT_MUZZLE_02)</li>
                     <li>Sessanta Nove (COMPONENT_CARBINERIFLE_MK2_CAMO_05)</li>
                     <li>Patriotic (COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01)</li>
                     <li>Fat-End Muzzle Brake (COMPONENT_AT_MUZZLE_03)</li>
                     <li>Skull (COMPONENT_CARBINERIFLE_MK2_CAMO_04)</li>
                     <li>Precision Muzzle Brake (COMPONENT_AT_MUZZLE_04)</li>
                     <li>Leopard (COMPONENT_CARBINERIFLE_MK2_CAMO_07)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## Machine gun group
<div class="category" id="machine-gun">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_RAYCARBINE.png" alt="Unholy Hellbringer">
         <div class="weapon-info">
            <span><strong>Name:</strong> Unholy Hellbringer</span>
            <span><strong>Hash:</strong> WEAPON_RAYCARBINE</span>
            <span><strong>Model Hash Key:</strong> w_ar_srifle</span>
            <span><strong>Description:</strong> Republican Space Ranger Special. If you want to turn a little green man into little green goo, this is the only American way to do it.</span>
            <div class="components"></div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Space Ranger tint</li>
                     <li>Purple tint</li>
                     <li>Green tint</li>
                     <li>Orange tint</li>
                     <li>Pink tint</li>
                     <li>Gold tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_GUSENBERG.png" alt="Gusenberg Sweeper">
         <div class="weapon-info">
            <span><strong>Name:</strong> Gusenberg Sweeper</span>
            <span><strong>Hash:</strong> WEAPON_GUSENBERG</span>
            <span><strong>Model Hash Key:</strong> w_sb_gusenberg</span>
            <span><strong>Description:</strong> Complete your look with a Prohibition gun. Looks great being fired from an Albany Roosevelt or paired with a pinstripe suit. Part of the Valentine's Day Massacre Special.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Default Clip (COMPONENT_GUSENBERG_CLIP_01)</li>
                     <li>Extended Clip (COMPONENT_GUSENBERG_CLIP_02)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_COMBATMG.png" alt="Combat MG">
         <div class="weapon-info">
            <span><strong>Name:</strong> Combat MG</span>
            <span><strong>Hash:</strong> WEAPON_COMBATMG</span>
            <span><strong>Model Hash Key:</strong> w_mg_combatmg</span>
            <span><strong>Description:</strong> Lightweight, compact machine gun that combines excellent maneuverability with a high rate of fire to devastating effect.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP)</li>
                     <li>Etched Gun Metal Finish (COMPONENT_COMBATMG_VARMOD_LOWRIDER)</li>
                     <li>Scope (COMPONENT_AT_SCOPE_MEDIUM)</li>
                     <li>Extended Clip (COMPONENT_COMBATMG_CLIP_02)</li>
                     <li>Default Clip (COMPONENT_COMBATMG_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_MG.png" alt="MG">
         <div class="weapon-info">
            <span><strong>Name:</strong> MG</span>
            <span><strong>Hash:</strong> WEAPON_MG</span>
            <span><strong>Model Hash Key:</strong> w_mg_mg</span>
            <span><strong>Description:</strong> General purpose machine gun that combines rugged design with dependable performance. Long range penetrative power. Very effective against large groups.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Scope (COMPONENT_AT_SCOPE_SMALL_02)</li>
                     <li>Extended Clip (COMPONENT_MG_CLIP_02)</li>
                     <li>Yusuf Amir Luxury Finish (COMPONENT_MG_VARMOD_LOWRIDER)</li>
                     <li>Default Clip (COMPONENT_MG_CLIP_01)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_COMBATMG_MK2.png" alt="Combat MG Mk II">
         <div class="weapon-info">
            <span><strong>Name:</strong> Combat MG Mk II</span>
            <span><strong>Hash:</strong> WEAPON_COMBATMG_MK2</span>
            <span><strong>Model Hash Key:</strong> w_mg_combatmgmk2</span>
            <span><strong>Description:</strong> You can never have too much of a good thing: after all, if the first shot counts, then the next hundred or so must count for double.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>Boom! (COMPONENT_COMBATMG_MK2_CAMO_10)</li>
                     <li>Heavy Duty Muzzle Brake (COMPONENT_AT_MUZZLE_05)</li>
                     <li>Geometric (COMPONENT_COMBATMG_MK2_CAMO_09)</li>
                     <li>Extended Clip (COMPONENT_COMBATMG_MK2_CLIP_02)</li>
                     <li>Zebra (COMPONENT_COMBATMG_MK2_CAMO_08)</li>
                     <li>Armor Piercing Rounds (COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING)</li>
                     <li>Slanted Muzzle Brake (COMPONENT_AT_MUZZLE_06)</li>
                     <li>Medium Scope (COMPONENT_AT_SCOPE_SMALL_MK2)</li>
                     <li>Holographic Sight (COMPONENT_AT_SIGHTS)</li>
                     <li>Sessanta Nove (COMPONENT_COMBATMG_MK2_CAMO_05)</li>
                     <li>Default Clip (COMPONENT_COMBATMG_MK2_CLIP_01)</li>
                     <li>Digital Camo (COMPONENT_COMBATMG_MK2_CAMO)</li>
                     <li>Split-End Muzzle Brake (COMPONENT_AT_MUZZLE_07)</li>
                     <li>Full Metal Jacket Rounds (COMPONENT_COMBATMG_MK2_CLIP_FMJ)</li>
                     <li>Skull (COMPONENT_COMBATMG_MK2_CAMO_04)</li>
                     <li>Leopard (COMPONENT_COMBATMG_MK2_CAMO_07)</li>
                     <li>Perseus (COMPONENT_COMBATMG_MK2_CAMO_06)</li>
                     <li>Grip (COMPONENT_AT_AR_AFGRIP_02)</li>
                     <li>Heavy Barrel (COMPONENT_AT_MG_BARREL_02)</li>
                     <li>Flat Muzzle Brake (COMPONENT_AT_MUZZLE_01)</li>
                     <li>Woodland Camo (COMPONENT_COMBATMG_MK2_CAMO_03)</li>
                     <li>Incendiary Rounds (COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY)</li>
                     <li>Default Barrel (COMPONENT_AT_MG_BARREL_01)</li>
                     <li>Large Scope (COMPONENT_AT_SCOPE_MEDIUM_MK2)</li>
                     <li>Tactical Muzzle Brake (COMPONENT_AT_MUZZLE_02)</li>
                     <li>Brushstroke Camo (COMPONENT_COMBATMG_MK2_CAMO_02)</li>
                     <li>Patriotic (COMPONENT_COMBATMG_MK2_CAMO_IND_01)</li>
                     <li>Fat-End Muzzle Brake (COMPONENT_AT_MUZZLE_03)</li>
                     <li>Precision Muzzle Brake (COMPONENT_AT_MUZZLE_04)</li>
                     <li>Tracer Rounds (COMPONENT_COMBATMG_MK2_CLIP_TRACER)</li>
                  </ul>
               </details>
            </div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Classic Black</li>
                     <li>Classic Gray</li>
                     <li>Classic Two-Tone</li>
                     <li>Classic White</li>
                     <li>Classic Beige</li>
                     <li>Classic Green</li>
                     <li>Classic Blue</li>
                     <li>Classic Earth</li>
                     <li>Classic Brown & Black</li>
                     <li>Red Contrast</li>
                     <li>Blue Contrast</li>
                     <li>Yellow Contrast</li>
                     <li>Orange Contrast</li>
                     <li>Bold Pink</li>
                     <li>Bold Purple & Yellow</li>
                     <li>Bold Orange</li>
                     <li>Bold Green & Purple</li>
                     <li>Bold Red Features</li>
                     <li>Bold Green Features</li>
                     <li>Bold Cyan Features</li>
                     <li>Bold Yellow Features</li>
                     <li>Bold Red & White</li>
                     <li>Bold Blue & White</li>
                     <li>Metallic Gold</li>
                     <li>Metallic Platinum</li>
                     <li>Metallic Gray & Lilac</li>
                     <li>Metallic Purple & Lime</li>
                     <li>Metallic Red</li>
                     <li>Metallic Green</li>
                     <li>Metallic Blue</li>
                     <li>Metallic White & Aqua</li>
                     <li>Metallic Red & Yellow</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>

## Unarmed group
<div class="category" id="unarmed">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_UNARMED.png" alt="Unarmed">
         <div class="weapon-info">
            <span><strong>Name:</strong> Unarmed</span>
            <span><strong>Hash:</strong> WEAPON_UNARMED</span>
            <span><strong>Model Hash Key:</strong> </span>
            <div class="components"></div>
            <div class="tints"></div>
         </div>
      </div>
      <div class="weapon">
         <img src="/weapons/WEAPON_KNUCKLE.png" alt="Knuckle Duster">
         <div class="weapon-info">
            <span><strong>Name:</strong> Knuckle Duster</span>
            <span><strong>Hash:</strong> WEAPON_KNUCKLE</span>
            <span><strong>Model Hash Key:</strong> W_ME_Knuckle</span>
            <span><strong>Description:</strong> Perfect for knocking out gold teeth, or as a gift to the trophy partner who has everything. Part of The Ill-Gotten Gains Update Part 2.</span>
            <div class="components">
               <details>
                  <summary>Components</summary>
                  <ul>
                     <li>The Player (COMPONENT_KNUCKLE_VARMOD_PLAYER)</li>
                     <li>The Lover (COMPONENT_KNUCKLE_VARMOD_LOVE)</li>
                     <li>The Hustler (COMPONENT_KNUCKLE_VARMOD_DOLLAR)</li>
                     <li>The Vagos (COMPONENT_KNUCKLE_VARMOD_VAGOS)</li>
                     <li>The Hater (COMPONENT_KNUCKLE_VARMOD_HATE)</li>
                     <li>The Rock (COMPONENT_KNUCKLE_VARMOD_DIAMOND)</li>
                     <li>The Pimp (COMPONENT_KNUCKLE_VARMOD_PIMP)</li>
                     <li>The King (COMPONENT_KNUCKLE_VARMOD_KING)</li>
                     <li>The Ballas (COMPONENT_KNUCKLE_VARMOD_BALLAS)</li>
                     <li>Base Model (COMPONENT_KNUCKLE_VARMOD_BASE)</li>
                  </ul>
               </details>
            </div>
            <div class="tints"></div>
         </div>
      </div>
   </div>
</div>

## Metal detector group
<div class="category" id="metal-detector">
   <div class="weapons">
      <div class="weapon">
         <img src="/weapons/WEAPON_METALDETECTOR.png" alt="Metal Detector">
         <div class="weapon-info">
            <span><strong>Name:</strong> Metal Detector</span>
            <span><strong>Hash:</strong> WEAPON_METALDETECTOR</span>
            <span><strong>Model Hash Key:</strong> w_am_digiscanner_reh</span>
            <span><strong>Description:</strong> ** PLACEHOLDER METAL DETECTOR DESCRIPTION **</span>
            <div class="components"></div>
            <div class="tints">
               <details>
                  <summary>Tints</summary>
                  <ul>
                     <li>Black tint</li>
                     <li>Green tint</li>
                     <li>Gold tint</li>
                     <li>Pink tint</li>
                     <li>Army tint</li>
                     <li>LSPD tint</li>
                     <li>Orange tint</li>
                     <li>Platinum tint</li>
                  </ul>
               </details>
            </div>
         </div>
      </div>
   </div>
</div>
