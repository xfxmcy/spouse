package com.xfxmcy.spouse.controller.video;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.controller.task.TaskController;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.VideoService;
import com.xfxmcy.spouse.util.SpouseUtil;
import com.xfxmcy.spouse.vo.SMFavorite;
import com.xfxmcy.spouse.vo.SMVideo;

/**
 * ClassName:TaskController
 * Function: video controller
 * Reason:	 video controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年5月30日		下午3:47:35
 *
 * @see 	 
 */
@Controller
@RequestMapping("/video")
public class VideoController {
private static final Logger logger = Logger.getLogger(TaskController.class);
	
	@Resource
	private VideoService videoServiceImpl;
	
	/**
	 * 
	 * doQuery:query video paged 
	 *
	 * @param param	param
	 * @param grid  grid
	 * @param request request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月29日 		cy
	 */
	@RequestMapping("/videoQuery")
	@ResponseBody
	public SpouseGrid doQuery(QueryParam param , SpouseGrid grid ,HttpServletRequest request){
		try{
			grid = videoServiceImpl.queryVideoPaged(param);
			logger.info(grid);
		}catch(Exception e){
			logger.error(e.getMessage());
		}	
		return grid;
	}
	/**
	 * 
	 * doPersistentVideo: persist a video
	 *
	 * @param param			 param
	 * @param video			 video
	 * @param info			 information
	 * @param request		 request	
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月29日 		cy
	 */
	@RequestMapping("/videoPersistent")
	@ResponseBody
	public SystemicInfo doPersistentVideo(QueryParam param , SMVideo video ,SystemicInfo info,HttpServletRequest request){
		try{
			video = videoServiceImpl.persistVideo(param,video);
			info.setSuccess(true, "success");
			info.setResult(video);
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	
	/**
	 * 
	 * doMergeVideo: merge a favorite 
	 *
	 * @param param		param
	 * @param video 	video
	 * @param info		information
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月29日 		cy
	 */
	@RequestMapping("/videoMerge")
	@ResponseBody
	public SystemicInfo doMergeVideo(QueryParam param , SMVideo video ,SystemicInfo info){
		try{
			video = videoServiceImpl.mergeVideo(param, video);
			info.setSuccess(true, "success");
			info.setResult(video);
		}catch(Exception e){
			logger.error(e.getMessage());
			info.setSuccess(false, "system busy , please have a wait");
		}
			return info;
	}
	
	/**
	 * 
	 * doDeleteVideo:delete a video 
	 *
	 * @param key	 pk
	 * @param param
	 * @param info
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月29日 		cy
	 */
	@RequestMapping("/videoDelete/{key}")
	@ResponseBody
	public SystemicInfo doDeleteVideo(@PathVariable String key,QueryParam param , SystemicInfo info){
		try{
			videoServiceImpl.deleteVideo(param, key);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
	/**
	 * 
	 * changeMusicTemplate:  make a template for music
	 *
	 * @param info
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年11月22日 		cy
	 */
	@RequestMapping("/templateMusic")
	@ResponseBody
	public SystemicInfo changeMusicTemplate(QueryParam param , SystemicInfo info ,HttpServletRequest request){
		try{
			param.setBaseUrl(request.getSession().getServletContext().getRealPath("/"));
			videoServiceImpl.contractMusicialTemplate(param);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
}
