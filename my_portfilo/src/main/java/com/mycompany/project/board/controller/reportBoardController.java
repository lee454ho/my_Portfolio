package com.mycompany.project.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.board.model.UploadVO;
import com.mycompany.project.board.model.reportBoardCriteria;
import com.mycompany.project.board.model.reportBoardDTO;
import com.mycompany.project.board.model.reportBoardPageMakerDTO;
import com.mycompany.project.board.service.reportBoardService;





@RequestMapping("/board")
@Controller
public class reportBoardController {
	@Autowired
	reportBoardService boardService;
	
	
	@RequestMapping(value = "/reportBoardList", method = RequestMethod.GET)
	public String list(Model model, reportBoardCriteria cri) {
		model.addAttribute("boardList",boardService.listPaging(cri));
		int total = boardService.total(cri);
		reportBoardPageMakerDTO pageMake = new reportBoardPageMakerDTO(cri, total);
		model.addAttribute("pageMaker",pageMake);

		return "/reportBoard/reportBoardList";
	}
		
	@RequestMapping(value = "/merge/reportBoardInsert", method = RequestMethod.GET)
	public String insert(Model model, Authentication auth) {
		
		String userid = auth.getName();
		model.addAttribute("userid", userid);
		
		return "/reportBoard/reportBoardInsert";
	}
	@RequestMapping(value = "/merge/reportBoardInsert", method = RequestMethod.POST)
	public ModelAndView insert(reportBoardDTO dto,UploadVO vo,@RequestParam MultipartFile file) {
		
		
		
	
		ModelAndView mv = new ModelAndView();
		
		MultipartFile uploadFile = vo.getFile();
		if(!uploadFile.isEmpty()) {
		String fileRealName = file.getOriginalFilename(); //�뙆�씪紐낆쓣 �뼸�뼱�궪 �닔 �엳�뒗 硫붿꽌�뱶!
		long size = file.getSize(); //�뙆�씪 �궗�씠利�
		//�꽌踰꾩뿉 ���옣�븷 �뙆�씪�씠由� fileextension�쑝濡� .jsp�씠�윴�떇�쓽  �솗�옣�옄 紐낆쓣 援ы븿
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "/Users/kim/Desktop/springImage/";
		/*
		  �뙆�씪 �뾽濡쒕뱶�떆 �뙆�씪紐낆씠 �룞�씪�븳 �뙆�씪�씠 �씠誘� 議댁옱�븷 �닔�룄 �엳怨� �궗�슜�옄媛� 
		  �뾽濡쒕뱶 �븯�뒗 �뙆�씪紐낆씠 �뼵�뼱 �씠�쇅�쓽 �뼵�뼱濡� �릺�뼱�엳�쓣 �닔 �엳�뒿�땲�떎. 
		  ���씤�뼱瑜� 吏��썝�븯吏� �븡�뒗 �솚寃쎌뿉�꽌�뒗 �젙�궛 �룞�옉�씠 �릺吏� �븡�뒿�땲�떎.(由щ늼�뒪媛� ���몴�쟻�씤 �삁�떆)
		  怨좎쑀�븳 �옖�뜡 臾몄옄瑜� �넻�빐 db�� �꽌踰꾩뿉 ���옣�븷 �뙆�씪紐낆쓣 �깉濡�寃� 留뚮뱾�뼱 以��떎.
		 */
		
		UUID uuid = UUID.randomUUID();

		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];

		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid �쟻�슜 �쟾
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // �쟻�슜 �썑
		try {
			file.transferTo(saveFile); // �떎�젣 �뙆�씪 ���옣硫붿꽌�뱶(filewriter �옉�뾽�쓣 �넀�돺寃� �븳諛⑹뿉 泥섎━�빐以��떎.)
		} catch (IllegalStateException e) {
		} catch (IOException e) {

		}
		vo.setName(uniqueName+fileExtension);
		vo.setFile_url(uploadFolder+"\\" + uniqueName + fileExtension );
		
		boardService.insert(dto,vo);
	
		
		mv.setViewName("redirect:/board/reportBoardList");

		return mv;
		}
		boardService.insert(dto,vo);
	
		
		mv.setViewName("redirect:/board/reportBoardList");

		return mv;
	}
	
    @RequestMapping(value = "/merge/fileDownload.do")
    public void fileDownload4(HttpServletRequest request,HttpServletResponse response) throws Exception {
        //String path =  request.getSession().getServletContext().getRealPath("���옣寃쎈줈");
        
        String filename =request.getParameter("fileName");
        String realFilename="";
        
         
        try {
            String browser = request.getHeader("User-Agent"); 
            //�뙆�씪 �씤肄붾뵫 
            if (browser.contains("MSIE") || browser.contains("Trident")
                    || browser.contains("Chrome")) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
                        "%20");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
        } catch (UnsupportedEncodingException ex) {
     
        }
        realFilename = "/Users/kim/Desktop/springImage/\\" + filename;

        File file1 = new File(realFilename);
        if (!file1.exists()) {
            return ;
        }
         
        // �뙆�씪紐� 吏��젙        
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
       
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realFilename);
 
            int ncount = 0;
            byte[] bytes = new byte[512];
 
            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
         
        	
        
    }

	
	
	
	
	@RequestMapping(value="/reportBoardDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map, reportBoardDTO dto, Authentication auth) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/reportBoard/reportBoardDetail");
		mv.addObject("data", boardService.detail(map));
		
		mv.addObject("loginUser", auth.getName());
		
		return mv;
	}
	
	@RequestMapping(value="/merge/reportBoardUpdate", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		
		Map<String, Object> list = boardService.detail(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", list);
		mv.setViewName("/reportBoard/reportBoardUpdate");
		
		return mv;
	}
	

	@RequestMapping(value="/merge/reportBoardUpdate", method = RequestMethod.POST)
	public ModelAndView update(reportBoardDTO dto,UploadVO vo, @RequestParam MultipartFile file) throws Exception {
		
		      ModelAndView mv = new ModelAndView();
		      //int free_board_id = boardService.update(dto);
		      // �뙆�씪 �뾽濡쒕뱶 泥섎━
		            String file_name = null;

				
		            MultipartFile uploadFile = vo.getFile();
		        
		            if (!uploadFile.isEmpty()) {
		            	  
		               String originalFileName = uploadFile.getOriginalFilename();
		               String ext = FilenameUtils.getExtension(originalFileName); // �솗�옣�옄 援ы븯湲�
		               long size = file.getSize(); //�뙆�씪 �궗�씠利�

		               String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),originalFileName.length());
		               String uploadFolder = "/Users/kim/Desktop/springImage/";
		               
		               UUID uuid = UUID.randomUUID(); // UUID 援ы븯湲�
		               String[] uuids = uuid.toString().split("-");
		               String uniqueName = uuids[0];

		               file_name = uuid + "." + ext;
		               uploadFile.transferTo(new File(uploadFolder +"\\"+ uniqueName+ fileExtension ));
		            
		               vo.setName(uniqueName+fileExtension);

		               vo.setFile_url(uploadFolder+"\\"+ uniqueName + fileExtension);
		             
		 		      boardService.update(dto,vo);
				      mv.setViewName("redirect:/board/reportBoardList");
				      
				      return mv;
		            
		            } else {
		               boardService.content_update(dto);
		               mv.setViewName("redirect:/board/reportBoardList");
		               
		               return mv;
		            }
		               

		 
		
		
	}	

	@RequestMapping(value = "/merge/reportBoardDelete", method = RequestMethod.GET)
	public String delete(@RequestParam("rboard_id") int rboard_id) {
		
		String url = boardService.getUrl(rboard_id);
		
		try {
			String path = url;
			File file = new File(path);
			
			if(file.delete()) {
				
			}else {
		
			}
		} catch (Exception e) {
			
		}
		boardService.delete(rboard_id);
		
		return "redirect:/board/reportBoardList";
	}
	
	@RequestMapping(value = "/merge/UpdateDeleteFile", method = RequestMethod.GET)
	public String UpdateDeleteFile(@RequestParam("rboard_id") int rboard_id) {
		String fileName = boardService.getFileName(rboard_id);
		String url = boardService.getUrl(rboard_id);
		
		boardService.columnDel(rboard_id);

			String path = url;
			File file = new File(path);
			
			file.delete();


		
		return "redirect:/board/merge/reportBoardUpdate";
	}

}


