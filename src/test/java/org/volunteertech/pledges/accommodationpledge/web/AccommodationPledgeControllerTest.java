package org.volunteertech.pledges.accommodationpledge.web;

import org.junit.Before;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

public class AccommodationPledgeControllerTest {

    private AccommodationPledgeController controller;

    private MockMvc mockMvc;

    @Before
    public void init() {
        controller = new AccommodationPledgeController();
        mockMvc = standaloneSetup(controller).build();
    }

    @Test
    public void showAllAccommodationPledge() throws Exception {

        mockMvc.perform(get("/accommodationpledge/all")).andExpect(view().name
                ("accommodations/accommodationpledge_table"));
    }

}