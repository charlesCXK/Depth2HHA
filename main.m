clc;
matrix_filename = 'camera_rotations_NYU.txt';
depth_image_root = './depth'       % dir where depth and raw depth images are in.
camera_matrix = textread(matrix_filename);     % import matrix data

for i=1:1449
    i
    matrix = camera_matrix(1+(i-1)*3:i*3,:);        % matrix of this image, 3*3
    D = imread(fullfile(depth_image_root, '/', [mat2str(i-1),'.png']));

    % here, RD is the same as D, because there is some problem about NYU Depth V2 raw-depth-images
    RD = imread(fullfile(depth_image_root, '/', [mat2str(i-1),'.png']));
    hha = saveHHA([mat2str(i-1), '_hha'], matrix, depth_image_root, D, RD);
end 