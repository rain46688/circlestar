<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
section.ac-container{
    width: 100em;
    height: 30em;
}

</style>
<jsp:include page="maincss.jsp"></jsp:include>
    <section class="ac-container">
        <div class="container-ac">
            <h2>Accordion Example</h2>
            <p><strong>Note:</strong> The <strong>data-parent</strong> attribute makes sure that all collapsible elements under the specified parent will be closed when one of the collapsible item is shown.</p>
            <div id="accordion">
              <div class="card">
                <div class="card-header">
                  <a class="card-link" data-toggle="collapse" href="#collapseOne">
                    Collapsible Group Item #1
                  </a>
                </div>
                <div id="collapseOne" class="collapse show" data-parent="#accordion">
                  <div class="card-body">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
                  Collapsible Group Item #2
                </a>
                </div>
                <div id="collapseTwo" class="collapse" data-parent="#accordion">
                  <div class="card-body">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
                    Collapsible Group Item #3
                  </a>
                </div>
                <div id="collapseThree" class="collapse" data-parent="#accordion">
                  <div class="card-body">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                  </div>
                </div>
              </div>
            </div>
          </div>
        
    </section> 

<%@ include file="/views/common/footer.jsp"%>
