# Depth2HHA

### Introduction

**First**, I want to thank **<a href='https://github.com/s-gupta'>s-gupta</a>** for his excellent work. Actually, I got some inspiration from his code and fixed some problems in it.

<br>

This repo is used to convert Depth images into HHA images. HHA is an encoding method which extract the information in the depth image which was proposed in <a href='https://arxiv.org/pdf/1407.5736.pdf'>Learning Rich Features from RGB-D Images for Object Detection and Segmentation</a>.  In this repo, I use <a href='https://cs.nyu.edu/~silberman/datasets/nyu_depth_v2.html'>NYU Depth V2</a> dataset as an example.

<br>

**All we need** is: 

1. A depth image
2. Camera rotation matrix ( This can be found in <a href='https://github.com/ankurhanda/nyuv2-meta-data/blob/master/camera_rotations_NYU.txt'>this repo</a>, and I also supply it in this repo)

<br>

### Usage

#### 1. Modify **main.m**

```matlab
matrix_filename = 'camera_rotations_NYU.txt';
depth_image_root = './depth'       % dir where depth and raw depth images are in.
```

***matrix_filename*** means file name of camera rotation matrix, and ***depth_image_root*** is the directory of where depth images are in. If you camera rotation matrix file is not the same as mine, you should modify the code in this file to read in the matrix for each picture correctly.

#### 2. Modify saveHHA.m

Look at this line.

```matlab
D = double(D)/10000;%./1000;        The unit of the element inside D is 'centimeter'
```

Here, *D* is the depth image. You may confused about the number '10000'. Because when I save the depth data as 'png', I multiply it with 10000. We all know that float number can not be saved as png or jpg, so I scale it. **Anyway**, after this line, the unit of the element in *D* should be 'meter'. It's up to you how to convert it.

#### 3. Others

You can directly run ***main.m*** to use this repo.