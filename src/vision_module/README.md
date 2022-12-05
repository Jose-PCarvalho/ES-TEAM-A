# pm_proj1

simple ball / object tracker using ROS and OpenCV

### Usage

``` roslaunch pm_proj1 proj.launch ```

### Arguments
 * ```material``` - selects video
    
    * Plastic (default)
    * Tennis
    * Extra

* ```show_original``` - shows original video and enables frame by frame analisis 
    
    * False (default)
    * True
    
* ```debug``` - opens debug tools (sets ```show_original``` to True)

    * False (default)
    * True

#### Example using arguments:
```roslaunch pm_proj1 proj.launch material:=Extra debug:=True```

## Add a new material and tune!

Place the video under ```/videos``` as ```video${MATERIAL}.mp4``` and create a new file under ```cfg``` named ```hsv_params_${MATERIAL}.yaml```