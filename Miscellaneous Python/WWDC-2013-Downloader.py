#!/usr/bin/env python3

# WWDC 2013 Video Downloader

import re
import urllib.request

# Create the list of WWDC Sessions

sessionList = list();
sessionList.append ("/videos/play/wwdc2013-100/");
sessionList.append ("/videos/play/wwdc2013-101/");
sessionList.append ("/videos/play/wwdc2013-109/");
sessionList.append ("/videos/play/wwdc2013-200/");
sessionList.append ("/videos/play/wwdc2013-201/");
sessionList.append ("/videos/play/wwdc2013-202/");
sessionList.append ("/videos/play/wwdc2013-203/");
sessionList.append ("/videos/play/wwdc2013-204/");
sessionList.append ("/videos/play/wwdc2013-205/");
sessionList.append ("/videos/play/wwdc2013-206/");
sessionList.append ("/videos/play/wwdc2013-207/");
sessionList.append ("/videos/play/wwdc2013-208/");
sessionList.append ("/videos/play/wwdc2013-209/");
sessionList.append ("/videos/play/wwdc2013-210/");
sessionList.append ("/videos/play/wwdc2013-211/");
sessionList.append ("/videos/play/wwdc2013-213/");
sessionList.append ("/videos/play/wwdc2013-214/");
sessionList.append ("/videos/play/wwdc2013-215/");
sessionList.append ("/videos/play/wwdc2013-216/");
sessionList.append ("/videos/play/wwdc2013-217/");
sessionList.append ("/videos/play/wwdc2013-218/");
sessionList.append ("/videos/play/wwdc2013-219/");
sessionList.append ("/videos/play/wwdc2013-220/");
sessionList.append ("/videos/play/wwdc2013-221/");
sessionList.append ("/videos/play/wwdc2013-222/");
sessionList.append ("/videos/play/wwdc2013-223/");
sessionList.append ("/videos/play/wwdc2013-224/");
sessionList.append ("/videos/play/wwdc2013-225/");
sessionList.append ("/videos/play/wwdc2013-226/");
sessionList.append ("/videos/play/wwdc2013-227/");
sessionList.append ("/videos/play/wwdc2013-228/");
sessionList.append ("/videos/play/wwdc2013-300/");
sessionList.append ("/videos/play/wwdc2013-301/");
sessionList.append ("/videos/play/wwdc2013-302/");
sessionList.append ("/videos/play/wwdc2013-303/");
sessionList.append ("/videos/play/wwdc2013-304/");
sessionList.append ("/videos/play/wwdc2013-305/");
sessionList.append ("/videos/play/wwdc2013-306/");
sessionList.append ("/videos/play/wwdc2013-307/");
sessionList.append ("/videos/play/wwdc2013-308/");
sessionList.append ("/videos/play/wwdc2013-309/");
sessionList.append ("/videos/play/wwdc2013-310/");
sessionList.append ("/videos/play/wwdc2013-400/");
sessionList.append ("/videos/play/wwdc2013-401/");
sessionList.append ("/videos/play/wwdc2013-402/");
sessionList.append ("/videos/play/wwdc2013-403/");
sessionList.append ("/videos/play/wwdc2013-404/");
sessionList.append ("/videos/play/wwdc2013-405/");
sessionList.append ("/videos/play/wwdc2013-406/");
sessionList.append ("/videos/play/wwdc2013-407/");
sessionList.append ("/videos/play/wwdc2013-408/");
sessionList.append ("/videos/play/wwdc2013-409/");
sessionList.append ("/videos/play/wwdc2013-410/");
sessionList.append ("/videos/play/wwdc2013-412/");
sessionList.append ("/videos/play/wwdc2013-413/");
sessionList.append ("/videos/play/wwdc2013-414/");
sessionList.append ("/videos/play/wwdc2013-415/");
sessionList.append ("/videos/play/wwdc2013-416/");
sessionList.append ("/videos/play/wwdc2013-417/");
sessionList.append ("/videos/play/wwdc2013-500/");
sessionList.append ("/videos/play/wwdc2013-501/");
sessionList.append ("/videos/play/wwdc2013-502/");
sessionList.append ("/videos/play/wwdc2013-503/");
sessionList.append ("/videos/play/wwdc2013-504/");
sessionList.append ("/videos/play/wwdc2013-505/");
sessionList.append ("/videos/play/wwdc2013-506/");
sessionList.append ("/videos/play/wwdc2013-507/");
sessionList.append ("/videos/play/wwdc2013-508/");
sessionList.append ("/videos/play/wwdc2013-509/");
sessionList.append ("/videos/play/wwdc2013-600/");
sessionList.append ("/videos/play/wwdc2013-601/");
sessionList.append ("/videos/play/wwdc2013-602/");
sessionList.append ("/videos/play/wwdc2013-603/");
sessionList.append ("/videos/play/wwdc2013-604/");
sessionList.append ("/videos/play/wwdc2013-605/");
sessionList.append ("/videos/play/wwdc2013-606/");
sessionList.append ("/videos/play/wwdc2013-607/");
sessionList.append ("/videos/play/wwdc2013-608/");
sessionList.append ("/videos/play/wwdc2013-609/");
sessionList.append ("/videos/play/wwdc2013-610/");
sessionList.append ("/videos/play/wwdc2013-611/");
sessionList.append ("/videos/play/wwdc2013-612/");
sessionList.append ("/videos/play/wwdc2013-613/");
sessionList.append ("/videos/play/wwdc2013-614/");
sessionList.append ("/videos/play/wwdc2013-615/");
sessionList.append ("/videos/play/wwdc2013-700/");
sessionList.append ("/videos/play/wwdc2013-701/");
sessionList.append ("/videos/play/wwdc2013-702/");
sessionList.append ("/videos/play/wwdc2013-703/");
sessionList.append ("/videos/play/wwdc2013-704/");
sessionList.append ("/videos/play/wwdc2013-705/");
sessionList.append ("/videos/play/wwdc2013-707/");
sessionList.append ("/videos/play/wwdc2013-708/");
sessionList.append ("/videos/play/wwdc2013-709/");
sessionList.append ("/videos/play/wwdc2013-710/");
sessionList.append ("/videos/play/wwdc2013-711/");
sessionList.append ("/videos/play/wwdc2013-712/");
sessionList.append ("/videos/play/wwdc2013-713/");
sessionList.append ("/videos/play/wwdc2013-714/");


for session in sessionList:

    # Get the page source for the video session page
    sessionPage = "https://developer.apple.com" + session;

    page = urllib.request.urlopen(sessionPage)
    pageSource = page.read().decode('utf-8')

    # Find the standard definition URL in the page source
    # Of the format: http://devstreaming.apple.com/videos/wwdc/2013/710xfx3xn8197k4i9s2rvyb/710/710-SD.mov
    expression = '(http:\/\/devstreaming.apple.com\/videos\/wwdc\/2013\/[^/]*\/\d\d\d\/\d\d\d-SD.mov)'
    regexResult = re.search (expression, pageSource)
	
    # Open the URL of the actual video
    videoUrl = regexResult.group(0);
    print ("Downloading: " + videoUrl)
    video = urllib.request.urlopen (videoUrl)
    
    # Find the filename of the video
    expression = '([^/]*mov)'
    regexResult = re.search (expression, videoUrl)
    filename = regexResult.group(0)
    
    # Save the video
    filePath = "/Users/prefrontal/Desktop/WWDC-2013/" + filename;
    output = open (filePath, 'wb')
    output.write (video.read())
    output.close()
    
    # For debugging...
    # person = input('-WAIT-')

print ("Downloading complete.")










