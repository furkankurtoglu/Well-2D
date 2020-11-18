clear
close all
clc

%%
cd output/

%%
s=what;
MatFiles = s.mat;
OutMatFiles = MatFiles(contains(MatFiles,'microenvironment0'));
OutMatFiles(1) = [];
OutMatFiles(1) = [];

filename1="MicroEnv.gif";

CMicEnvOutMatFiles = MatFiles(contains(MatFiles,'microenvironment1'));
names={'Oxygen','Glucose','Glutamine','Lactate'};
Save_MicEnv = 'Y';
Save_CMicEnv = 'N';

for i = 1:length(OutMatFiles)+1


    if (Save_MicEnv == 'Y')
    out = read_microenvironment(strcat(OutMatFiles{i}));
    h = figure(1);
    set(gcf, 'Position',  [0, 0, 1344, 756])
    plot_microenvironment(out,names)
    frame = getframe(h);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File
    if i == 1
        imwrite(imind,cm,filename1,'gif', 'Loopcount',inf);
        print('hey')
    else
        imwrite(imind,cm,filename1,'gif','WriteMode','append');
    end
    end

end
    
%%
cd ..