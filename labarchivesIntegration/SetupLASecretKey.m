%% Setup LA Secret Key
% Here's a link to our current API documentation: 
%https://mynotebook.labarchives.com/share/LabArchives%20API/NS4yfDI3LzQvVHJlZU5vZGUvMzU0MzQ4ODY0M3wxMy4y

%% use github to sync your data_analysis repository with sgarrettroe/data_analysis

%% set up the path just in case
str=which('sgrsfft'); %find where data_analysis is installed
[pathstr]=fileparts(str);
str1 = [pathstr filesep 'labarchivesIntegration']
str2 = [pathstr filesep 'labarchivesIntegration' filesep 'DataHash_20190519']
str3 = [pathstr filesep 'labarchivesIntegration' filesep 'HMAC']
str4 = [pathstr filesep 'labarchivesIntegration' filesep 'xml2struct']
addpath(str1,str2,str3,str4);
savepath;

%% test w/o key file (only have to do this once)
%go to LabArchives.com in a browser
% 1) login (use the SSO feature, two-factor authentication, etc)
% 2) click your name
% 3) click LA App authentication
% 4) copy the really long key (only good for 1 hour)

% these are constants (don't share them or post online)
akid = 'UPittsburgh';
access_password = 'u9iZdsthiI2Y68k$b5WqbQ==';

% update these variables
LAuser = '<USERNAME>@pitt.edu'; %<==== update this
LApw = '';% <====== paste code here (watch for spaces at the beginning)...

% call the website and authenticate
obj = labarchivesCallObj('akid',akid,'access_password',access_password,...
    'user',LAuser,'password',LApw);

%% save credentials for future use
% this function will create a file LABARCHIVES_SECRET_KEYS.mat in your
% default directory. Now you don't need to use the complicated login
% procedure again :)
obj.saveSecretKeys;

clear